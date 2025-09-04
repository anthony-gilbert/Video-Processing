# CRUSH.md - Video Processing Project

## Build/Test/Lint Commands
```bash
# Frontend (Vue.js dashboard)
cd frontend/dashboard
npm run dev                    # Start development server
npm run build                  # Build for production
npm run type-check             # TypeScript type checking
npm run lint                   # ESLint with auto-fix
npm run format                 # Prettier formatting
npm run test:unit              # Run unit tests with Vitest
npm run test:unit -- HelloWorld.spec.ts  # Run single test file
npm run test:e2e               # Run E2E tests with Playwright
```

## Code Style Guidelines

### Vue.js/TypeScript
- Use **single quotes** for strings, **no semicolons**
- **100 character** line width limit
- Use **Composition API** with `<script setup lang="ts">`
- Define props with `defineProps<{ prop: type }>()`
- Import Vue Router as: `import { createRouter } from 'vue-router'`
- Use **kebab-case** for component file names, **PascalCase** for component names
- Place tests in `__tests__/` directories alongside components
- Use **scoped styles** in Vue components

### General Conventions
- Use **TypeScript** for all new code
- Follow **ESLint** and **Prettier** configurations
- Use **Vitest** for unit tests, **Playwright** for E2E tests
- Lazy-load routes with dynamic imports: `() => import('../views/View.vue')`
- Use **Pinia** for state management