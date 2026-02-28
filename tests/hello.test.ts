import { describe, expect, it } from 'vitest';
import { hello } from '../src/index.js';

describe('hello', () => {
  it('greets world by default', () => {
    expect(hello()).toBe('hello, world');
  });
  it('greets by name', () => {
    expect(hello('Massi')).toBe('hello, Massi');
  });
});
