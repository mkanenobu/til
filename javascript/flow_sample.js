// @flow
type A = {
  s: string,
  n: number,
}

const a: A = { s: 'string' }
const b: $Exact<A> = { s: 'string' }
