-- ════════════════════════════════════════════════════════════════
-- SCHEMA DE BASE DE DATOS PARA LIQUIDACIÓN DE GASTOS DE VIAJE
-- Copiar y pegar en Supabase SQL Editor
-- ════════════════════════════════════════════════════════════════

-- Tabla de viajes
CREATE TABLE trips (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  nombre TEXT,
  club TEXT,
  razon TEXT,
  signature_data_url TEXT,
  closed BOOLEAN DEFAULT false,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de facturas/tickets
CREATE TABLE invoices (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  trip_id UUID NOT NULL REFERENCES trips(id) ON DELETE CASCADE,
  status TEXT NOT NULL DEFAULT 'done', -- 'loading', 'done', 'error'
  image_data TEXT, -- base64 de la imagen
  fecha TEXT,
  concepto TEXT,
  precio DECIMAL(10,2),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Índice para búsquedas rápidas
CREATE INDEX idx_invoices_trip_id ON invoices(trip_id);
CREATE INDEX idx_trips_created_at ON trips(created_at DESC);

-- Actualizar timestamp automáticamente
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_trips_updated_at
  BEFORE UPDATE ON trips
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_invoices_updated_at
  BEFORE UPDATE ON invoices
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- ════════════════════════════════════════════════════════════════
-- SEGURIDAD: RLS (Row Level Security)
-- Como es uso personal, permitimos acceso total
-- ════════════════════════════════════════════════════════════════

ALTER TABLE trips ENABLE ROW LEVEL SECURITY;
ALTER TABLE invoices ENABLE ROW LEVEL SECURITY;

-- Políticas: permitir todo (para uso personal/interno)
CREATE POLICY "Allow all on trips" ON trips FOR ALL USING (true);
CREATE POLICY "Allow all on invoices" ON invoices FOR ALL USING (true);

-- ════════════════════════════════════════════════════════════════
-- FIN DEL SCHEMA
-- ════════════════════════════════════════════════════════════════
