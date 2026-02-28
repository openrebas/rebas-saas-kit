export function hello(name: string = "world"): string {
  return `hello, ${name}`;
}

if (import.meta.url === `file://${process.argv[1]}`) {
  // CLI run
  // eslint-disable-next-line no-console
  console.log(hello());
}
