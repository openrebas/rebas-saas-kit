export function hello(name: string = 'world'): string {
  return `hello, ${name}`;
}

// Allow direct execution for a quick smoke test
if (typeof require !== 'undefined' && require.main === module) {
  // eslint-disable-next-line no-console
  console.log(hello());
}
