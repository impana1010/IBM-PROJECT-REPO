# SmartCart AI

An AI-powered shopping assistant built with **FastAPI** + **React + TypeScript + Tailwind CSS**.

> ⚠️ **All product data, prices, reviews, and price histories in this project are synthetic demo data.
> They do not represent real market data or real products.**

---

## Features

| Feature | Description |
|---|---|
| 🛍️ Product Catalog | 25 realistic products across 5 categories with full specs |
| 🔍 Smart Search | Full-text search with automatic query analysis (budget, category, features) |
| 🤖 AI Recommendations | Weighted scoring engine with 5 priority profiles |
| ⚖️ Product Comparison | Side-by-side comparison of up to 4 products with winner selection |
| 📊 Review Analysis | Sentiment distribution, theme extraction, suspicious pattern detection |
| 📈 Price Tracker | Track products and set price alerts |
| 🛒 Shopping List | Manage a persistent shopping list with quantities |
| ⚙️ Preferences | Budget, brand, category, sustainability and quality preferences |
| 💬 AI Assistant | Conversational chat (demo/watsonx.ai/Langflow) |

---

## Project Structure

```
smartcart/
  backend/
    main.py                          # FastAPI app, CORS, startup
    database.py                      # SQLAlchemy engine, session, Base
    models.py                        # ORM models
    routers/
      products.py                    # GET /api/products, /api/products/{id}
      search.py                      # POST /api/search
      compare.py                     # POST /api/compare
      recommend.py                   # POST /api/recommend
      reviews.py                     # POST /api/reviews/analyze
      tracker.py                     # GET/POST/DELETE /api/tracked-products, /api/alerts
      shopping_list.py               # CRUD /api/shopping-list
      preferences.py                 # GET/PUT /api/preferences
      assistant.py                   # POST /api/assistant/chat
    services/
      demo_data.py                   # 25-product synthetic catalog
      recommendation_engine.py       # Weighted scoring, search, filter, rank
      review_analyzer.py             # Sentiment, themes, suspicious patterns
      ai_service.py                  # demo / watsonx.ai / Langflow abstraction
    requirements.txt
    .env.example
  frontend/
    src/
      App.tsx                        # Status dashboard + API endpoint listing
      main.tsx
      index.css
    index.html
    package.json
    vite.config.ts                   # Dev proxy → localhost:8000
    tailwind.config.js
  README.md
```

---

## Quick Start

### Backend

```bash
cd smartcart/backend

# 1. Create a virtual environment
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

# 2. Install dependencies
pip install -r requirements.txt

# 3. Copy environment file
cp .env.example .env
# Edit .env if you want to enable watsonx.ai or Langflow

# 4. Run the server
uvicorn main:app --reload --port 8000
```

API docs available at **http://localhost:8000/docs**

### Frontend

---

## AI Modes

The AI service detects credentials automatically at startup:

| Mode | When | Description |
|---|---|---|
| `demo` | No credentials set (default) | Rule-based engine references real product records |
| `watsonx` | `IBM_WATSONX_API_KEY` set | IBM watsonx.ai Granite inference API |
| `langflow` | `IBM_LANGFLOW_URL` set | IBM Langflow flow endpoint |

---

## Environment Variables

Copy `backend/.env.example` to `backend/.env` and fill in as needed:

```env
# IBM watsonx.ai (optional)
IBM_WATSONX_API_KEY=your_key_here
IBM_WATSONX_PROJECT_ID=your_project_id
IBM_WATSONX_URL=https://us-south.ml.cloud.ibm.com
IBM_WATSONX_MODEL_ID=ibm/granite-13b-chat-v2

# IBM Langflow (optional)
IBM_LANGFLOW_URL=https://your-langflow-endpoint/api/v1/run/flow-id
IBM_LANGFLOW_API_KEY=

# App
DATABASE_URL=sqlite:///./smartcart.db
CORS_ORIGINS=http://localhost:5173,http://localhost:3000
DEBUG=true
```

---

## API Reference

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/health` | Health check + AI mode status |
| GET | `/api/products` | List products (filter by category, brand, price, rating, sort) |
| GET | `/api/products/{id}` | Product detail |
| GET | `/api/products/{id}/price-history` | Price history (demo) |
| POST | `/api/search` | Full-text search with query analysis |
| POST | `/api/compare` | Compare 2–4 products |
| POST | `/api/recommend` | Get scored recommendations |
| POST | `/api/reviews/analyze` | Analyze product reviews |
| GET | `/api/tracked-products` | List tracked products |
| POST | `/api/tracked-products` | Track a product |
| DELETE | `/api/tracked-products/{id}` | Remove tracker |
| GET | `/api/alerts` | List price alerts |
| POST | `/api/alerts` | Create price alert |
| GET | `/api/shopping-list` | Get shopping list |
| POST | `/api/shopping-list` | Add item |
| PATCH | `/api/shopping-list/{id}` | Update item |
| DELETE | `/api/shopping-list/{id}` | Remove item |
| GET | `/api/preferences` | Get user preferences |
| PUT | `/api/preferences` | Update preferences |
| POST | `/api/assistant/chat` | AI assistant chat |

---

## Product Categories

- **smartphones** — 6 products (Samsung, Redmi, OnePlus, iQOO, Realme, Motorola)
- **laptops** — 6 products (Lenovo, HP, Acer, ASUS, Dell, ThinkPad)
- **headphones** — 5 products (Sony, boAt ×2, JBL, Sennheiser)
- **smartwatches** — 5 products (Apple, Samsung, Noise, boAt, Amazfit)
- **home_appliances** — 5 products (Dyson, LG, Philips, Bajaj, Havells)

---

## Recommendation Priority Profiles

| Priority | Budget | Rating | Value | Features | Sustainability |
|---|---|---|---|---|---|
| `best_value` | 30% | 25% | 30% | 10% | 5% |
| `best_quality` | 10% | 40% | 10% | 30% | 10% |
| `best_price` | 50% | 15% | 25% | 5% | 5% |
| `best_sustainability` | 10% | 20% | 10% | 10% | 50% |
| `best_match` | 25% | 20% | 20% | 30% | 5% |

---

## Data Disclaimer

All product names, prices, specifications, reviews, and price histories are **fabricated for
demonstration purposes only**. This project is not affiliated with any of the brands mentioned.


## 🚀 Live Prototype

[Click here to open SmartCart AI](https://thriving-puffpuff-df0f9b.netlify.app)
