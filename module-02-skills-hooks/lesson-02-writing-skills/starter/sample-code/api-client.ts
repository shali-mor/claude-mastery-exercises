// api-client.ts — HTTP client for the internal API

const BASE_URL = process.env.API_BASE_URL || 'https://api.example.com';

interface RequestOptions {
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE' | 'PATCH';
  body?: unknown;
  headers?: Record<string, string>;
  timeout?: number;
}

interface ApiResponse<T> {
  data: T;
  status: number;
  ok: boolean;
}

async function request<T>(
  endpoint: string,
  options: RequestOptions = {}
): Promise<ApiResponse<T>> {
  const { method = 'GET', body, headers = {}, timeout = 5000 } = options;

  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), timeout);

  try {
    const response = await fetch(`${BASE_URL}${endpoint}`, {
      method,
      headers: {
        'Content-Type': 'application/json',
        'X-API-Key': process.env.API_KEY || '',
        ...headers,
      },
      body: body ? JSON.stringify(body) : undefined,
      signal: controller.signal,
    });

    const data = await response.json();
    return { data, status: response.status, ok: response.ok };
  } finally {
    clearTimeout(timeoutId);
  }
}

export async function fetchUser(userId: string): Promise<ApiResponse<{ id: string; name: string; email: string }>> {
  if (!userId) throw new Error('userId is required');
  return request(`/users/${userId}`);
}

export async function createUser(payload: { name: string; email: string; password: string }) {
  return request('/users', { method: 'POST', body: payload });
}

export async function deleteUser(userId: string) {
  return request(`/users/${userId}`, { method: 'DELETE' });
}

export async function listUsers(page = 1, limit = 20) {
  return request(`/users?page=${page}&limit=${limit}`);
}
