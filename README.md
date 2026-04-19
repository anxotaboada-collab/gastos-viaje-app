# 📱 Liquidación de Gastos de Viaje - Jandia Playa S.A.

App profesional con base de datos en la nube para gestionar gastos de viaje con lectura automática de facturas mediante IA.

## ✅ Lo que necesitas (todo gratis)

1. Una cuenta de **GitHub** (para guardar el código)
2. Una cuenta de **Supabase** (para la base de datos)
3. Una cuenta de **Vercel** (para publicar la web)
4. Una cuenta de **Anthropic** (para la IA que lee las facturas)

---

## 📋 GUÍA PASO A PASO (45 minutos)

### PASO 1: Crear cuenta en GitHub (5 min)

1. Ve a [github.com](https://github.com)
2. Haz clic en "Sign up"
3. Crea tu cuenta con tu email
4. Verifica tu email
5. **Guarda tu usuario y contraseña** — los necesitarás

---

### PASO 2: Subir el código a GitHub (10 min)

#### Opción A: Desde la web (más fácil)

1. Una vez dentro de GitHub, haz clic en el botón verde **"New"** (arriba a la izquierda)
2. Nombre del repositorio: `gastos-viaje-app`
3. Marca como **"Public"** (público)
4. Desmarca "Add a README file"
5. Haz clic en **"Create repository"**

6. Verás una pantalla vacía. Haz clic en **"uploading an existing file"** (arriba)

7. Arrastra TODOS estos archivos a la zona de carga:
   - `index.html`
   - `supabase-schema.sql`
   - `vercel.json`
   - `package.json`
   - `.gitignore`
   - `README.md` (este archivo)

8. Abajo en "Commit changes", escribe: `Primera versión`
9. Haz clic en **"Commit changes"** (botón verde)

✅ **Ya tienes el código en GitHub**

#### Opción B: Con GitHub Desktop (alternativa)

Si prefieres usar una aplicación:

1. Descarga **GitHub Desktop** de [desktop.github.com](https://desktop.github.com)
2. Instálalo e inicia sesión con tu cuenta de GitHub
3. Haz clic en "Create a New Repository"
4. Nombre: `gastos-viaje-app`
5. Selecciona dónde guardarlo en tu ordenador
6. Haz clic en "Create Repository"
7. Copia todos los archivos del proyecto a esa carpeta
8. En GitHub Desktop verás los archivos — haz clic en "Commit to main"
9. Luego haz clic en "Publish repository"

---

### PASO 3: Crear la base de datos en Supabase (15 min)

1. Ve a [supabase.com](https://supabase.com)
2. Haz clic en **"Start your project"**
3. Conéctate con tu cuenta de GitHub (más fácil)

4. Haz clic en **"New project"**
   - Organization: crea una nueva (ponle tu nombre)
   - Name: `gastos-viaje`
   - Database Password: **COPIA Y GUARDA ESTA CONTRASEÑA** (la necesitarás)
   - Region: Europe West (London)
   - Haz clic en **"Create new project"** (tarda 2-3 minutos)

5. Una vez creado, en el menú izquierdo haz clic en **"SQL Editor"**

6. Haz clic en **"New query"**

7. Abre el archivo `supabase-schema.sql` que descargaste

8. **Copia TODO el contenido** del archivo y pégalo en el editor de Supabase

9. Haz clic en el botón **"Run"** (abajo a la derecha)

10. Deberías ver: "Success. No rows returned"

✅ **Base de datos creada**

11. Ahora ve a **"Settings"** (icono de engranaje abajo a la izquierda)

12. Haz clic en **"API"**

13. **COPIA Y GUARDA** estos dos valores (los necesitarás en el siguiente paso):
    - **Project URL** (algo como: `https://xxxxx.supabase.co`)
    - **anon public** key (es una clave larga que empieza con `eyJ...`)

---

### PASO 4: Configurar las claves en el código (5 min)

1. Abre el archivo `index.html` con un editor de texto (Notepad, TextEdit, o mejor **VS Code**)

2. Busca estas dos líneas (están casi al principio):
```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

3. Reemplázalas con tus valores de Supabase:
```javascript
const SUPABASE_URL = 'https://xxxxx.supabase.co';  // Tu Project URL
const SUPABASE_ANON_KEY = 'eyJxxxxxxxxx';  // Tu anon key
```

4. **Guarda el archivo**

5. Sube el archivo actualizado a GitHub:
   - Si usaste la web: ve a tu repositorio → haz clic en `index.html` → Edit this file → pega el nuevo contenido → Commit changes
   - Si usaste GitHub Desktop: el cambio se detectará automáticamente → Commit → Push

---

### PASO 5: Publicar en Vercel (10 min)

1. Ve a [vercel.com](https://vercel.com)
2. Haz clic en **"Start Deploying"**
3. Conéctate con tu cuenta de **GitHub**

4. Haz clic en **"Import Project"** o **"Add New"** → **"Project"**

5. Selecciona tu repositorio **`gastos-viaje-app`**

6. En la pantalla de configuración:
   - Framework Preset: **Other**
   - Root Directory: `.` (déjalo como está)
   - Build Command: (déjalo vacío)
   - Output Directory: (déjalo vacío)

7. Haz clic en **"Deploy"**

8. Espera 1-2 minutos... ¡Y LISTO!

9. Verás una pantalla de celebración con tu URL tipo:
   `https://gastos-viaje-app.vercel.app`

10. **Copia esa URL** — es tu app publicada en internet

✅ **¡APP PUBLICADA!**

---

### PASO 6: Configurar la IA para leer facturas (5 min)

La app incluye **4 opciones de IA** — elige la que prefieras:

#### 🆓 OPCIÓN 1: Tesseract.js (RECOMENDADA para empezar)
- **100% GRATIS** — no necesita clave API
- Corre en tu navegador — los datos nunca salen de tu dispositivo
- Menos preciso que las otras, pero sin coste
- **YA ESTÁ ACTIVADA** — no necesitas hacer nada

#### 💎 OPCIÓN 2: Anthropic Claude (la mejor calidad)
1. Ve a [console.anthropic.com](https://console.anthropic.com)
2. Crea cuenta → API Keys → Create Key
3. Copia la clave (empieza con `sk-ant-api03-...`)
4. En la app → ⚙ Ajustes → Proveedor: "Anthropic Claude"
5. Pega la clave → Guardar
- **Coste**: $5 gratis iniciales, luego ~$0.003 por factura

#### 🔍 OPCIÓN 3: Google Vision API (generosa)
1. Ve a [console.cloud.google.com](https://console.cloud.google.com)
2. Crea proyecto → Activa "Vision API"
3. Crea credenciales (API Key)
4. En la app → ⚙ Ajustes → Proveedor: "Google Vision API"
5. Pega la clave → Guardar
- **Coste**: 1000 facturas/mes GRATIS

#### 🤖 OPCIÓN 4: OpenAI GPT-4o-mini (económica)
1. Ve a [platform.openai.com](https://platform.openai.com)
2. Crea cuenta → API Keys → Create
3. Copia la clave (empieza con `sk-...`)
4. En la app → ⚙ Ajustes → Proveedor: "OpenAI GPT-4o-mini"
5. Pega la clave → Guardar
- **Coste**: $5 gratis iniciales, luego ~$0.0015 por factura

**Puedes cambiar de proveedor cuando quieras en ⚙ Ajustes**

✅ **¡Listo! Empieza con Tesseract (gratis) y cambia después si quieres más precisión**

---

## 🤖 COMPARATIVA DE PROVEEDORES DE IA

| Proveedor | Coste | Precisión | Velocidad | Privacidad |
|-----------|-------|-----------|-----------|------------|
| **Tesseract.js** | ✅ Gratis | ⭐⭐⭐ | ⭐⭐⭐ | 🔒 Total |
| **Anthropic** | $5 gratis → $0.003/fact | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 🔒 Buena |
| **Google Vision** | 1000/mes gratis | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | 🔒 Buena |
| **OpenAI** | $5 gratis → $0.0015/fact | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ | 🔒 Buena |

**¿Cuál elegir?**
- **Uso ocasional (< 20 facturas/mes)**: Tesseract.js — gratis total
- **Mejor calidad**: Anthropic Claude
- **Más facturas gratis**: Google Vision (1000/mes)
- **Más económica**: OpenAI GPT-4o-mini

**Tesseract.js** es perfecta para empezar porque:
- No necesitas crear cuentas
- No gastas dinero
- Tus fotos nunca salen del navegador
- Funciona offline (una vez cargada la app)

---

## 🎯 CÓMO USAR LA APP

1. Abre tu URL de Vercel en el móvil o ordenador
2. Inicia sesión (usuario: `anxo` / contraseña: `11223344`)
3. Crea un viaje nuevo con el botón **"+ Nuevo"**
4. Haz fotos a las facturas o sube imágenes
5. La IA lee automáticamente la fecha, concepto e importe
6. Firma con el dedo en la pantalla del móvil
7. Al terminar, pulsa **"Cerrar viaje"** y luego **"📄 PDF"**
8. Descarga la liquidación oficial completa con todas las evidencias

---

## 🔐 CAMBIAR USUARIO Y CONTRASEÑA

Para cambiar el usuario/contraseña del login:

1. Abre `index.html` en un editor
2. Busca esta línea:
```javascript
const CREDENTIALS = { anxo: '11223344' };
```
3. Cámbiala por:
```javascript
const CREDENTIALS = { tunombre: 'tucontraseña' };
```
4. Guarda y sube el cambio a GitHub
5. Vercel detectará el cambio y actualizará automáticamente (1-2 min)

---

## 📊 VER LOS DATOS EN SUPABASE

Si quieres ver todos los viajes y facturas guardados:

1. Ve a tu proyecto en Supabase
2. Haz clic en **"Table Editor"** (icono de tabla)
3. Verás las tablas `trips` e `invoices` con todos los datos

---

## 🆘 SOLUCIÓN DE PROBLEMAS

### "Error al cargar los datos"
→ Revisa que las claves de Supabase estén bien copiadas en `index.html` (líneas 120-121)

### "Error al procesar factura"
→ Comprueba qué proveedor de IA tienes seleccionado en ⚙ Ajustes
→ Si es Tesseract: debería funcionar siempre (es más lento pero no falla)
→ Si es otro: verifica que la clave API esté correctamente guardada

### Tesseract detecta mal las facturas
→ Es normal — Tesseract es menos preciso
→ Cambia a Anthropic o Google Vision en ⚙ Ajustes para mejor precisión
→ Asegúrate de que las fotos sean claras y bien iluminadas

### "API Key inválida" con Anthropic/Google/OpenAI
→ Verifica que copiaste la clave completa (sin espacios al final)
→ Anthropic: debe empezar con `sk-ant-api03-`
→ OpenAI: debe empezar con `sk-`
→ Google: es una clave alfanumérica larga

### La app no se actualiza tras hacer cambios
→ Ve a Vercel → tu proyecto → Deployments → 3 puntos del último deploy → "Redeploy"

### No puedo iniciar sesión
→ Usuario: `anxo` (en minúsculas) / Contraseña: `11223344`

---

## 📱 AÑADIR LA APP AL MÓVIL (como una app nativa)

### iPhone/iPad:
1. Abre tu URL en Safari
2. Toca el botón de compartir (cuadrado con flecha)
3. Desplázate y toca **"Añadir a pantalla de inicio"**
4. Ponle un nombre (ej: "Gastos Viaje")
5. Toca "Añadir"
6. ¡Ya tienes un icono como una app normal!

### Android:
1. Abre tu URL en Chrome
2. Toca los 3 puntos (arriba a la derecha)
3. Toca **"Añadir a pantalla de inicio"**
4. Confirma
5. ¡Listo!

---

## 💰 COSTES

- **GitHub**: Gratis
- **Supabase**: Gratis hasta 500 MB de datos + 2 GB de transferencia/mes
- **Vercel**: Gratis para proyectos personales
- **IA (Tesseract.js)**: 100% GRATIS sin límite
- **IA (Anthropic)**: $5 gratis iniciales, luego ~$0.003/factura
- **IA (Google Vision)**: 1000 facturas/mes GRATIS
- **IA (OpenAI)**: $5 gratis iniciales, luego ~$0.0015/factura

**Total estimado con Tesseract.js**: **$0/mes** para uso personal típico

**Total estimado con Anthropic/OpenAI**: Gratis durante meses (con $5 iniciales puedes analizar ~1600-3300 facturas)

---

## 🔄 ACTUALIZAR LA APP EN EL FUTURO

1. Haz los cambios en los archivos
2. Sube los cambios a GitHub
3. Vercel detecta automáticamente y actualiza en 1-2 minutos
4. **¡No hace falta hacer nada más!**

---

## 📧 SOPORTE

Si algo no funciona, revisa paso a paso esta guía. La mayoría de problemas vienen de:
- Claves de Supabase mal copiadas
- No haber ejecutado el SQL en Supabase
- Olvidar guardar la clave API de Anthropic en la app

---

**¡Disfruta de tu app profesional de gastos de viaje!** ✈️📊
