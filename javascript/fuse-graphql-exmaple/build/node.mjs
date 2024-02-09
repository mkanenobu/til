var __defProp = Object.defineProperty;
var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
var __publicField = (obj, key, value) => {
  __defNormalProp(obj, typeof key !== "symbol" ? key + "" : key, value);
  return value;
};
var __accessCheck = (obj, member, msg) => {
  if (!member.has(obj))
    throw TypeError("Cannot " + msg);
};
var __privateGet = (obj, member, getter) => {
  __accessCheck(obj, member, "read from private field");
  return getter ? getter.call(obj) : member.get(obj);
};
var __privateAdd = (obj, member, value) => {
  if (member.has(obj))
    throw TypeError("Cannot add the same private member more than once");
  member instanceof WeakSet ? member.add(obj) : member.set(obj, value);
};
var __privateSet = (obj, member, value, setter) => {
  __accessCheck(obj, member, "write to private field");
  setter ? setter.call(obj, value) : member.set(obj, value);
  return value;
};
var __privateWrapper = (obj, member, setter, getter) => ({
  set _(value) {
    __privateSet(obj, member, value, setter);
  },
  get _() {
    return __privateGet(obj, member, getter);
  }
});
var __privateMethod = (obj, member, method) => {
  __accessCheck(obj, member, "access private method");
  return method;
};
var _b, _c, _d, _constructing, _max, _maxSize, _dispose, _disposeAfter, _fetchMethod, _size, _calculatedSize, _keyMap, _keyList, _valList, _next, _prev, _head, _tail, _free, _disposed, _sizes, _starts, _ttls, _hasDispose, _hasFetchMethod, _hasDisposeAfter, _initializeTTLTracking, initializeTTLTracking_fn, _updateItemAge, _statusTTL, _setItemTTL, _isStale, _initializeSizeTracking, initializeSizeTracking_fn, _removeItemSize, _addItemSize, _requireSize, _indexes, indexes_fn, _rindexes, rindexes_fn, _isValidIndex, isValidIndex_fn, _e, _evict, evict_fn, _backgroundFetch, backgroundFetch_fn, _isBackgroundFetch, isBackgroundFetch_fn, _connect, connect_fn, _moveToTail, moveToTail_fn;
import require$$0$3 from "http";
import { builder } from "fuse";
import { versionInfo, GraphQLError, isNonNullType, Kind, valueFromAST, print, GraphQLDirective, DirectiveLocation, GraphQLNonNull, GraphQLBoolean, GraphQLString, GraphQLInt, getDirectiveValues, GraphQLSkipDirective, GraphQLIncludeDirective, typeFromAST, isAbstractType, isSchema, isInputType, coerceInputValue, assertValidSchema, locatedError, isListType, isLeafType, isObjectType, SchemaMetaFieldDef, TypeMetaFieldDef, TypeNameMetaFieldDef, getOperationAST, parse, validate, specifiedRules, getNamedType, isInterfaceType, isWrappingType, GraphQLSchema, NoSchemaIntrospectionCustomRule, introspectionFromSchema } from "graphql";
import require$$0$6 from "fs";
import require$$1$1 from "url";
import require$$0$4 from "node:stream";
import require$$0$1 from "stream";
import require$$0$2 from "node:util";
import require$$1 from "https";
import require$$3 from "zlib";
import require$$0$5 from "querystring";
import require$$3$1 from "stream/web";
import require$$4 from "crypto";
function _mergeNamespaces(n, m) {
  for (var i = 0; i < m.length; i++) {
    const e = m[i];
    if (typeof e !== "string" && !Array.isArray(e)) {
      for (const k in e) {
        if (k !== "default" && !(k in n)) {
          const d = Object.getOwnPropertyDescriptor(e, k);
          if (d) {
            Object.defineProperty(n, k, d.get ? d : {
              enumerable: true,
              get: () => e[k]
            });
          }
        }
      }
    }
  }
  return Object.freeze(Object.defineProperty(n, Symbol.toStringTag, { value: "Module" }));
}
const MAX_RECURSIVE_DEPTH = 3;
function inspect(value) {
  return formatValue(value, []);
}
function formatValue(value, seenValues) {
  switch (typeof value) {
    case "string":
      return JSON.stringify(value);
    case "function":
      return value.name ? `[function ${value.name}]` : "[function]";
    case "object":
      return formatObjectValue(value, seenValues);
    default:
      return String(value);
  }
}
function formatError(value) {
  if (value.name = "GraphQLError") {
    return value.toString();
  }
  return `${value.name}: ${value.message};
 ${value.stack}`;
}
function formatObjectValue(value, previouslySeenValues) {
  if (value === null) {
    return "null";
  }
  if (value instanceof Error) {
    if (value.name === "AggregateError") {
      return formatError(value) + "\n" + formatArray(value.errors, previouslySeenValues);
    }
    return formatError(value);
  }
  if (previouslySeenValues.includes(value)) {
    return "[Circular]";
  }
  const seenValues = [...previouslySeenValues, value];
  if (isJSONable(value)) {
    const jsonValue = value.toJSON();
    if (jsonValue !== value) {
      return typeof jsonValue === "string" ? jsonValue : formatValue(jsonValue, seenValues);
    }
  } else if (Array.isArray(value)) {
    return formatArray(value, seenValues);
  }
  return formatObject(value, seenValues);
}
function isJSONable(value) {
  return typeof value.toJSON === "function";
}
function formatObject(object, seenValues) {
  const entries = Object.entries(object);
  if (entries.length === 0) {
    return "{}";
  }
  if (seenValues.length > MAX_RECURSIVE_DEPTH) {
    return "[" + getObjectTag(object) + "]";
  }
  const properties = entries.map(([key, value]) => key + ": " + formatValue(value, seenValues));
  return "{ " + properties.join(", ") + " }";
}
function formatArray(array, seenValues) {
  if (array.length === 0) {
    return "[]";
  }
  if (seenValues.length > MAX_RECURSIVE_DEPTH) {
    return "[Array]";
  }
  const len = array.length;
  const items = [];
  for (let i = 0; i < len; ++i) {
    items.push(formatValue(array[i], seenValues));
  }
  return "[" + items.join(", ") + "]";
}
function getObjectTag(object) {
  const tag = Object.prototype.toString.call(object).replace(/^\[object /, "").replace(/]$/, "");
  if (tag === "Object" && typeof object.constructor === "function") {
    const name = object.constructor.name;
    if (typeof name === "string" && name !== "") {
      return name;
    }
  }
  return tag;
}
const possibleGraphQLErrorProperties = [
  "message",
  "locations",
  "path",
  "nodes",
  "source",
  "positions",
  "originalError",
  "name",
  "stack",
  "extensions"
];
function isGraphQLErrorLike(error) {
  return error != null && typeof error === "object" && Object.keys(error).every((key) => possibleGraphQLErrorProperties.includes(key));
}
function createGraphQLError(message, options) {
  if ((options == null ? void 0 : options.originalError) && !(options.originalError instanceof Error) && isGraphQLErrorLike(options.originalError)) {
    options.originalError = createGraphQLError(options.originalError.message, options.originalError);
  }
  if (versionInfo.major >= 17) {
    return new GraphQLError(message, options);
  }
  return new GraphQLError(message, options == null ? void 0 : options.nodes, options == null ? void 0 : options.source, options == null ? void 0 : options.positions, options == null ? void 0 : options.path, options == null ? void 0 : options.originalError, options == null ? void 0 : options.extensions);
}
function isIterableObject(value) {
  return value != null && typeof value === "object" && Symbol.iterator in value;
}
function isObjectLike(value) {
  return typeof value === "object" && value !== null;
}
function isPromise$1(value) {
  return (value == null ? void 0 : value.then) != null;
}
function promiseReduce(values, callbackFn, initialValue) {
  let accumulator = initialValue;
  for (const value of values) {
    accumulator = isPromise$1(accumulator) ? accumulator.then((resolved) => callbackFn(resolved, value)) : callbackFn(accumulator, value);
  }
  return accumulator;
}
function hasOwnProperty(obj, prop) {
  return Object.prototype.hasOwnProperty.call(obj, prop);
}
function getArgumentValues(def, node, variableValues = {}) {
  const coercedValues = {};
  const argumentNodes = node.arguments ?? [];
  const argNodeMap = argumentNodes.reduce((prev, arg) => ({
    ...prev,
    [arg.name.value]: arg
  }), {});
  for (const { name, type: argType, defaultValue } of def.args) {
    const argumentNode = argNodeMap[name];
    if (!argumentNode) {
      if (defaultValue !== void 0) {
        coercedValues[name] = defaultValue;
      } else if (isNonNullType(argType)) {
        throw createGraphQLError(`Argument "${name}" of required type "${inspect(argType)}" was not provided.`, {
          nodes: [node]
        });
      }
      continue;
    }
    const valueNode = argumentNode.value;
    let isNull = valueNode.kind === Kind.NULL;
    if (valueNode.kind === Kind.VARIABLE) {
      const variableName = valueNode.name.value;
      if (variableValues == null || !hasOwnProperty(variableValues, variableName)) {
        if (defaultValue !== void 0) {
          coercedValues[name] = defaultValue;
        } else if (isNonNullType(argType)) {
          throw createGraphQLError(`Argument "${name}" of required type "${inspect(argType)}" was provided the variable "$${variableName}" which was not provided a runtime value.`, {
            nodes: [valueNode]
          });
        }
        continue;
      }
      isNull = variableValues[variableName] == null;
    }
    if (isNull && isNonNullType(argType)) {
      throw createGraphQLError(`Argument "${name}" of non-null type "${inspect(argType)}" must not be null.`, {
        nodes: [valueNode]
      });
    }
    const coercedValue = valueFromAST(valueNode, argType, variableValues);
    if (coercedValue === void 0) {
      throw createGraphQLError(`Argument "${name}" has invalid value ${print(valueNode)}.`, {
        nodes: [valueNode]
      });
    }
    coercedValues[name] = coercedValue;
  }
  return coercedValues;
}
function memoize1(fn) {
  const memoize1cache = /* @__PURE__ */ new WeakMap();
  return function memoized(a1) {
    const cachedValue = memoize1cache.get(a1);
    if (cachedValue === void 0) {
      const newValue = fn(a1);
      memoize1cache.set(a1, newValue);
      return newValue;
    }
    return cachedValue;
  };
}
function memoize3(fn) {
  const memoize3Cache = /* @__PURE__ */ new WeakMap();
  return function memoized(a1, a2, a3) {
    let cache2 = memoize3Cache.get(a1);
    if (!cache2) {
      cache2 = /* @__PURE__ */ new WeakMap();
      memoize3Cache.set(a1, cache2);
      const cache32 = /* @__PURE__ */ new WeakMap();
      cache2.set(a2, cache32);
      const newValue = fn(a1, a2, a3);
      cache32.set(a3, newValue);
      return newValue;
    }
    let cache3 = cache2.get(a2);
    if (!cache3) {
      cache3 = /* @__PURE__ */ new WeakMap();
      cache2.set(a2, cache3);
      const newValue = fn(a1, a2, a3);
      cache3.set(a3, newValue);
      return newValue;
    }
    const cachedValue = cache3.get(a3);
    if (cachedValue === void 0) {
      const newValue = fn(a1, a2, a3);
      cache3.set(a3, newValue);
      return newValue;
    }
    return cachedValue;
  };
}
function memoize5(fn) {
  const memoize5Cache = /* @__PURE__ */ new WeakMap();
  return function memoized(a1, a2, a3, a4, a5) {
    let cache2 = memoize5Cache.get(a1);
    if (!cache2) {
      cache2 = /* @__PURE__ */ new WeakMap();
      memoize5Cache.set(a1, cache2);
      const cache32 = /* @__PURE__ */ new WeakMap();
      cache2.set(a2, cache32);
      const cache42 = /* @__PURE__ */ new WeakMap();
      cache32.set(a3, cache42);
      const cache52 = /* @__PURE__ */ new WeakMap();
      cache42.set(a4, cache52);
      const newValue = fn(a1, a2, a3, a4, a5);
      cache52.set(a5, newValue);
      return newValue;
    }
    let cache3 = cache2.get(a2);
    if (!cache3) {
      cache3 = /* @__PURE__ */ new WeakMap();
      cache2.set(a2, cache3);
      const cache42 = /* @__PURE__ */ new WeakMap();
      cache3.set(a3, cache42);
      const cache52 = /* @__PURE__ */ new WeakMap();
      cache42.set(a4, cache52);
      const newValue = fn(a1, a2, a3, a4, a5);
      cache52.set(a5, newValue);
      return newValue;
    }
    let cache4 = cache3.get(a3);
    if (!cache4) {
      cache4 = /* @__PURE__ */ new WeakMap();
      cache3.set(a3, cache4);
      const cache52 = /* @__PURE__ */ new WeakMap();
      cache4.set(a4, cache52);
      const newValue = fn(a1, a2, a3, a4, a5);
      cache52.set(a5, newValue);
      return newValue;
    }
    let cache5 = cache4.get(a4);
    if (!cache5) {
      cache5 = /* @__PURE__ */ new WeakMap();
      cache4.set(a4, cache5);
      const newValue = fn(a1, a2, a3, a4, a5);
      cache5.set(a5, newValue);
      return newValue;
    }
    const cachedValue = cache5.get(a5);
    if (cachedValue === void 0) {
      const newValue = fn(a1, a2, a3, a4, a5);
      cache5.set(a5, newValue);
      return newValue;
    }
    return cachedValue;
  };
}
function getDefinedRootType(schema, operation, nodes) {
  const rootTypeMap = getRootTypeMap(schema);
  const rootType = rootTypeMap.get(operation);
  if (rootType == null) {
    throw createGraphQLError(`Schema is not configured to execute ${operation} operation.`, {
      nodes
    });
  }
  return rootType;
}
const getRootTypeMap = memoize1(function getRootTypeMap2(schema) {
  const rootTypeMap = /* @__PURE__ */ new Map();
  const queryType = schema.getQueryType();
  if (queryType) {
    rootTypeMap.set("query", queryType);
  }
  const mutationType = schema.getMutationType();
  if (mutationType) {
    rootTypeMap.set("mutation", mutationType);
  }
  const subscriptionType = schema.getSubscriptionType();
  if (subscriptionType) {
    rootTypeMap.set("subscription", subscriptionType);
  }
  return rootTypeMap;
});
function mapAsyncIterator$1(iterator, callback, rejectCallback) {
  let $return;
  let abruptClose;
  if (typeof iterator.return === "function") {
    $return = iterator.return;
    abruptClose = (error) => {
      const rethrow = () => Promise.reject(error);
      return $return.call(iterator).then(rethrow, rethrow);
    };
  }
  function mapResult(result) {
    return result.done ? result : asyncMapValue(result.value, callback).then(iteratorResult, abruptClose);
  }
  let mapReject;
  if (rejectCallback) {
    const reject = rejectCallback;
    mapReject = (error) => asyncMapValue(error, reject).then(iteratorResult, abruptClose);
  }
  return {
    next() {
      return iterator.next().then(mapResult, mapReject);
    },
    return() {
      return $return ? $return.call(iterator).then(mapResult, mapReject) : Promise.resolve({ value: void 0, done: true });
    },
    throw(error) {
      if (typeof iterator.throw === "function") {
        return iterator.throw(error).then(mapResult, mapReject);
      }
      return Promise.reject(error).catch(abruptClose);
    },
    [Symbol.asyncIterator]() {
      return this;
    }
  };
}
function asyncMapValue(value, callback) {
  return new Promise((resolve) => resolve(callback(value)));
}
function iteratorResult(value) {
  return { value, done: false };
}
class AccumulatorMap extends Map {
  get [Symbol.toStringTag]() {
    return "AccumulatorMap";
  }
  add(key, item) {
    const group = this.get(key);
    if (group === void 0) {
      this.set(key, [item]);
    } else {
      group.push(item);
    }
  }
}
const GraphQLDeferDirective = new GraphQLDirective({
  name: "defer",
  description: "Directs the executor to defer this fragment when the `if` argument is true or undefined.",
  locations: [DirectiveLocation.FRAGMENT_SPREAD, DirectiveLocation.INLINE_FRAGMENT],
  args: {
    if: {
      type: new GraphQLNonNull(GraphQLBoolean),
      description: "Deferred when true or undefined.",
      defaultValue: true
    },
    label: {
      type: GraphQLString,
      description: "Unique name"
    }
  }
});
const GraphQLStreamDirective = new GraphQLDirective({
  name: "stream",
  description: "Directs the executor to stream plural fields when the `if` argument is true or undefined.",
  locations: [DirectiveLocation.FIELD],
  args: {
    if: {
      type: new GraphQLNonNull(GraphQLBoolean),
      description: "Stream when true or undefined.",
      defaultValue: true
    },
    label: {
      type: GraphQLString,
      description: "Unique name"
    },
    initialCount: {
      defaultValue: 0,
      type: GraphQLInt,
      description: "Number of items to return immediately"
    }
  }
});
function collectFieldsImpl(schema, fragments, variableValues, runtimeType, selectionSet, fields, patches, visitedFragmentNames) {
  for (const selection of selectionSet.selections) {
    switch (selection.kind) {
      case Kind.FIELD: {
        if (!shouldIncludeNode(variableValues, selection)) {
          continue;
        }
        fields.add(getFieldEntryKey(selection), selection);
        break;
      }
      case Kind.INLINE_FRAGMENT: {
        if (!shouldIncludeNode(variableValues, selection) || !doesFragmentConditionMatch(schema, selection, runtimeType)) {
          continue;
        }
        const defer = getDeferValues(variableValues, selection);
        if (defer) {
          const patchFields = new AccumulatorMap();
          collectFieldsImpl(schema, fragments, variableValues, runtimeType, selection.selectionSet, patchFields, patches, visitedFragmentNames);
          patches.push({
            label: defer.label,
            fields: patchFields
          });
        } else {
          collectFieldsImpl(schema, fragments, variableValues, runtimeType, selection.selectionSet, fields, patches, visitedFragmentNames);
        }
        break;
      }
      case Kind.FRAGMENT_SPREAD: {
        const fragName = selection.name.value;
        if (!shouldIncludeNode(variableValues, selection)) {
          continue;
        }
        const defer = getDeferValues(variableValues, selection);
        if (visitedFragmentNames.has(fragName) && !defer) {
          continue;
        }
        const fragment = fragments[fragName];
        if (!fragment || !doesFragmentConditionMatch(schema, fragment, runtimeType)) {
          continue;
        }
        if (!defer) {
          visitedFragmentNames.add(fragName);
        }
        if (defer) {
          const patchFields = new AccumulatorMap();
          collectFieldsImpl(schema, fragments, variableValues, runtimeType, fragment.selectionSet, patchFields, patches, visitedFragmentNames);
          patches.push({
            label: defer.label,
            fields: patchFields
          });
        } else {
          collectFieldsImpl(schema, fragments, variableValues, runtimeType, fragment.selectionSet, fields, patches, visitedFragmentNames);
        }
        break;
      }
    }
  }
}
function collectFields(schema, fragments, variableValues, runtimeType, selectionSet) {
  const fields = new AccumulatorMap();
  const patches = [];
  collectFieldsImpl(schema, fragments, variableValues, runtimeType, selectionSet, fields, patches, /* @__PURE__ */ new Set());
  return { fields, patches };
}
function shouldIncludeNode(variableValues, node) {
  const skip = getDirectiveValues(GraphQLSkipDirective, node, variableValues);
  if ((skip == null ? void 0 : skip["if"]) === true) {
    return false;
  }
  const include = getDirectiveValues(GraphQLIncludeDirective, node, variableValues);
  if ((include == null ? void 0 : include["if"]) === false) {
    return false;
  }
  return true;
}
function doesFragmentConditionMatch(schema, fragment, type) {
  const typeConditionNode = fragment.typeCondition;
  if (!typeConditionNode) {
    return true;
  }
  const conditionalType = typeFromAST(schema, typeConditionNode);
  if (conditionalType === type) {
    return true;
  }
  if (isAbstractType(conditionalType)) {
    const possibleTypes = schema.getPossibleTypes(conditionalType);
    return possibleTypes.includes(type);
  }
  return false;
}
function getFieldEntryKey(node) {
  return node.alias ? node.alias.value : node.name.value;
}
function getDeferValues(variableValues, node) {
  const defer = getDirectiveValues(GraphQLDeferDirective, node, variableValues);
  if (!defer) {
    return;
  }
  if (defer["if"] === false) {
    return;
  }
  return {
    label: typeof defer["label"] === "string" ? defer["label"] : void 0
  };
}
const collectSubFields = memoize5(function collectSubfields(schema, fragments, variableValues, returnType, fieldNodes) {
  const subFieldNodes = new AccumulatorMap();
  const visitedFragmentNames = /* @__PURE__ */ new Set();
  const subPatches = [];
  const subFieldsAndPatches = {
    fields: subFieldNodes,
    patches: subPatches
  };
  for (const node of fieldNodes) {
    if (node.selectionSet) {
      collectFieldsImpl(schema, fragments, variableValues, returnType, node.selectionSet, subFieldNodes, subPatches, visitedFragmentNames);
    }
  }
  return subFieldsAndPatches;
});
function isAsyncIterable$2(value) {
  return (value == null ? void 0 : value[Symbol.asyncIterator]) != null;
}
function addPath(prev, key, typename) {
  return { prev, key, typename };
}
function pathToArray(path) {
  const flattened = [];
  let curr = path;
  while (curr) {
    flattened.push(curr.key);
    curr = curr.prev;
  }
  return flattened.reverse();
}
function printPathArray(path) {
  return path.map((key) => typeof key === "number" ? "[" + key.toString() + "]" : "." + key).join("");
}
function isAggregateError(obj) {
  return obj != null && typeof obj === "object" && "errors" in obj;
}
function hasToString(obj) {
  return obj != null && typeof obj.toString === "function";
}
function isGraphQLError$1(val) {
  return val instanceof GraphQLError;
}
function isOriginalGraphQLError$1(val) {
  if (val instanceof GraphQLError) {
    if (val.originalError != null) {
      return isOriginalGraphQLError$1(val.originalError);
    }
    return true;
  }
  return false;
}
function handleError(error, maskedErrorsOpts, logger) {
  const errors = /* @__PURE__ */ new Set();
  if (isAggregateError(error)) {
    for (const singleError of error.errors) {
      const handledErrors = handleError(singleError, maskedErrorsOpts, logger);
      for (const handledError of handledErrors) {
        errors.add(handledError);
      }
    }
  } else if (maskedErrorsOpts) {
    const maskedError = maskedErrorsOpts.maskError(error, maskedErrorsOpts.errorMessage, maskedErrorsOpts.isDev);
    if (maskedError !== error) {
      logger.error(error);
    }
    errors.add(isGraphQLError$1(maskedError) ? maskedError : createGraphQLError(maskedError.message, {
      originalError: maskedError
    }));
  } else if (isGraphQLError$1(error)) {
    errors.add(error);
  } else if (error instanceof Error) {
    errors.add(createGraphQLError(error.message, {
      originalError: error
    }));
  } else if (typeof error === "string") {
    errors.add(createGraphQLError(error, {
      extensions: {
        unexpected: true
      }
    }));
  } else if (hasToString(error)) {
    errors.add(createGraphQLError(error.toString(), {
      extensions: {
        unexpected: true
      }
    }));
  } else {
    logger.error(error);
    errors.add(createGraphQLError("Unexpected error.", {
      extensions: {
        http: {
          unexpected: true
        }
      }
    }));
  }
  return Array.from(errors);
}
function getResponseInitByRespectingErrors(result, headers = {}, isApplicationJson = false) {
  var _a, _b2, _c2, _d2;
  let status;
  let unexpectedErrorExists = false;
  if ("extensions" in result && ((_a = result.extensions) == null ? void 0 : _a.http)) {
    if (result.extensions.http.headers) {
      Object.assign(headers, result.extensions.http.headers);
    }
    if (result.extensions.http.status) {
      status = result.extensions.http.status;
    }
  }
  if ("errors" in result && ((_b2 = result.errors) == null ? void 0 : _b2.length)) {
    for (const error of result.errors) {
      if ((_c2 = error.extensions) == null ? void 0 : _c2.http) {
        if (error.extensions.http.headers) {
          Object.assign(headers, error.extensions.http.headers);
        }
        if (isApplicationJson && error.extensions.http.spec) {
          continue;
        }
        if (error.extensions.http.status && (!status || error.extensions.http.status > status)) {
          status = error.extensions.http.status;
        }
      } else if (!isOriginalGraphQLError$1(error) || ((_d2 = error.extensions) == null ? void 0 : _d2.unexpected)) {
        unexpectedErrorExists = true;
      }
    }
  } else {
    status || (status = 200);
  }
  if (!status) {
    if (unexpectedErrorExists && !("data" in result)) {
      status = 500;
    } else {
      status = 200;
    }
  }
  return {
    status,
    headers
  };
}
function areGraphQLErrors(obj) {
  return Array.isArray(obj) && obj.length > 0 && // if one item in the array is a GraphQLError, we're good
  obj.some(isGraphQLError$1);
}
const ansiCodes = {
  red: "\x1B[31m",
  yellow: "\x1B[33m",
  magenta: "\x1B[35m",
  cyan: "\x1B[36m",
  reset: "\x1B[0m"
};
const warnPrefix = ansiCodes.yellow + "WARN" + ansiCodes.reset;
const infoPrefix = ansiCodes.cyan + "INFO" + ansiCodes.reset;
const errorPrefix = ansiCodes.red + "ERR" + ansiCodes.reset;
const debugPrefix = ansiCodes.magenta + "DEBUG" + ansiCodes.reset;
const logLevelScores = {
  debug: 0,
  info: 1,
  warn: 2,
  error: 3,
  silent: 4
};
const noop = () => {
};
const consoleLog = (prefix) => (...args) => console.log(prefix, ...args);
const debugLog = console.debug ? (...args) => console.debug(debugPrefix, ...args) : consoleLog(debugPrefix);
const infoLog = console.info ? (...args) => console.info(infoPrefix, ...args) : consoleLog(infoPrefix);
const warnLog = console.warn ? (...args) => console.warn(warnPrefix, ...args) : consoleLog(warnPrefix);
const errorLog = console.error ? (...args) => console.error(errorPrefix, ...args) : consoleLog(errorPrefix);
const createLogger = (logLevel = ((_a) => (_a = globalThis.process) == null ? void 0 : _a.env["DEBUG"])() === "1" ? "debug" : "info") => {
  const score = logLevelScores[logLevel];
  return {
    debug: score > logLevelScores.debug ? noop : debugLog,
    info: score > logLevelScores.info ? noop : infoLog,
    warn: score > logLevelScores.warn ? noop : warnLog,
    error: score > logLevelScores.error ? noop : errorLog
  };
};
const graphiqlHTML = '<!doctype html><html lang=en><head><meta charset=utf-8><title>__TITLE__</title><link rel=icon href=https://raw.githubusercontent.com/dotansimha/graphql-yoga/main/website/public/favicon.ico><link rel=stylesheet href=https://unpkg.com/@graphql-yoga/graphiql@4.2.1/dist/style.css></head><body id=body class=no-focus-outline><noscript>You need to enable JavaScript to run this app.</noscript><div id=root></div><script type=module>import{renderYogaGraphiQL}from"https://unpkg.com/@graphql-yoga/graphiql@4.2.1/dist/yoga-graphiql.es.js";renderYogaGraphiQL(root,__OPTS__)<\/script></body></html>';
function shouldRenderGraphiQL({ headers, method }) {
  var _a;
  return method === "GET" && !!((_a = headers == null ? void 0 : headers.get("accept")) == null ? void 0 : _a.includes("text/html"));
}
const renderGraphiQL = (opts) => graphiqlHTML.replace("__TITLE__", (opts == null ? void 0 : opts.title) || "Yoga GraphiQL").replace("__OPTS__", JSON.stringify(opts ?? {}));
function useGraphiQL(config) {
  const logger = config.logger ?? console;
  let graphiqlOptionsFactory;
  if (typeof (config == null ? void 0 : config.options) === "function") {
    graphiqlOptionsFactory = config == null ? void 0 : config.options;
  } else if (typeof (config == null ? void 0 : config.options) === "object") {
    graphiqlOptionsFactory = () => config == null ? void 0 : config.options;
  } else if ((config == null ? void 0 : config.options) === false) {
    graphiqlOptionsFactory = () => false;
  } else {
    graphiqlOptionsFactory = () => ({});
  }
  const renderer = (config == null ? void 0 : config.render) ?? renderGraphiQL;
  let urlPattern;
  const getUrlPattern = ({ URLPattern: URLPattern2 }) => {
    urlPattern || (urlPattern = new URLPattern2({
      pathname: config.graphqlEndpoint
    }));
    return urlPattern;
  };
  return {
    async onRequest({ request, serverContext, fetchAPI, endResponse: endResponse2, url }) {
      if (shouldRenderGraphiQL(request) && (request.url.endsWith(config.graphqlEndpoint) || request.url.endsWith(`${config.graphqlEndpoint}/`) || url.pathname === config.graphqlEndpoint || url.pathname === `${config.graphqlEndpoint}/` || getUrlPattern(fetchAPI).test(url))) {
        logger.debug(`Rendering GraphiQL`);
        const graphiqlOptions = await graphiqlOptionsFactory(request, serverContext);
        if (graphiqlOptions) {
          const graphiQLBody = await renderer({
            ...graphiqlOptions === true ? {} : graphiqlOptions
          });
          const response = new fetchAPI.Response(graphiQLBody, {
            headers: {
              "Content-Type": "text/html"
            },
            status: 200
          });
          endResponse2(response);
        }
      }
    }
  };
}
const useSchema = (schemaDef) => {
  if (schemaDef == null) {
    return {};
  }
  if (isSchema(schemaDef)) {
    return {
      onPluginInit({ setSchema }) {
        setSchema(schemaDef);
      }
    };
  }
  if ("then" in schemaDef) {
    let schema;
    return {
      onRequestParse() {
        return {
          async onRequestParseDone() {
            schema || (schema = await schemaDef);
          }
        };
      },
      onEnveloped({ setSchema }) {
        if (!schema) {
          throw new Error(`You provide a promise of a schema but it hasn't been resolved yet. Make sure you use this plugin with GraphQL Yoga.`);
        }
        setSchema(schema);
      }
    };
  }
  const schemaByRequest = /* @__PURE__ */ new WeakMap();
  return {
    onRequestParse({ request, serverContext }) {
      return {
        async onRequestParseDone() {
          const schema = await schemaDef({
            ...serverContext,
            request
          });
          schemaByRequest.set(request, schema);
        }
      };
    },
    onEnveloped({ setSchema, context }) {
      if ((context == null ? void 0 : context.request) == null) {
        throw new Error("Request object is not available in the context. Make sure you use this plugin with GraphQL Yoga.");
      }
      const schema = schemaByRequest.get(context.request);
      if (schema == null) {
        throw new Error(`No schema found for this request. Make sure you use this plugin with GraphQL Yoga.`);
      }
      setSchema(schema);
    }
  };
};
const documentStringMap = /* @__PURE__ */ new WeakMap();
function getSubscribeArgs(args) {
  return args.length === 1 ? args[0] : {
    schema: args[0],
    document: args[1],
    rootValue: args[2],
    contextValue: args[3],
    variableValues: args[4],
    operationName: args[5],
    fieldResolver: args[6],
    subscribeFieldResolver: args[7]
  };
}
const makeSubscribe = (subscribeFn) => (...polyArgs) => subscribeFn(getSubscribeArgs(polyArgs));
function mapAsyncIterator(source, mapper) {
  const iterator = source[Symbol.asyncIterator]();
  async function mapResult(result) {
    var _a;
    if (result.done) {
      return result;
    }
    try {
      return { value: await mapper(result.value), done: false };
    } catch (error) {
      try {
        await ((_a = iterator.return) == null ? void 0 : _a.call(iterator));
      } catch (_error) {
      }
      throw error;
    }
  }
  const stream = {
    [Symbol.asyncIterator]() {
      return stream;
    },
    async next() {
      return await mapResult(await iterator.next());
    },
    async return() {
      var _a;
      const promise = (_a = iterator.return) == null ? void 0 : _a.call(iterator);
      return promise ? await mapResult(await promise) : { value: void 0, done: true };
    },
    async throw(error) {
      var _a;
      const promise = (_a = iterator.throw) == null ? void 0 : _a.call(iterator);
      if (promise) {
        return await mapResult(await promise);
      }
      throw error;
    }
  };
  return stream;
}
function getExecuteArgs(args) {
  return args.length === 1 ? args[0] : {
    schema: args[0],
    document: args[1],
    rootValue: args[2],
    contextValue: args[3],
    variableValues: args[4],
    operationName: args[5],
    fieldResolver: args[6],
    typeResolver: args[7]
  };
}
const makeExecute = (executeFn) => (...polyArgs) => executeFn(getExecuteArgs(polyArgs));
function isAsyncIterable$1(maybeAsyncIterable) {
  return typeof maybeAsyncIterable === "object" && maybeAsyncIterable != null && typeof maybeAsyncIterable[Symbol.asyncIterator] === "function";
}
function handleStreamOrSingleExecutionResult(payload, fn) {
  if (isAsyncIterable$1(payload.result)) {
    return { onNext: fn };
  }
  fn({
    args: payload.args,
    result: payload.result,
    setResult: payload.setResult
  });
  return void 0;
}
function finalAsyncIterator(source, onFinal) {
  const iterator = source[Symbol.asyncIterator]();
  let isDone = false;
  const stream = {
    [Symbol.asyncIterator]() {
      return stream;
    },
    async next() {
      const result = await iterator.next();
      if (result.done && isDone === false) {
        isDone = true;
        onFinal();
      }
      return result;
    },
    async return() {
      var _a;
      const promise = (_a = iterator.return) == null ? void 0 : _a.call(iterator);
      if (isDone === false) {
        isDone = true;
        onFinal();
      }
      return promise ? await promise : { done: true, value: void 0 };
    },
    async throw(error) {
      var _a;
      const promise = (_a = iterator.throw) == null ? void 0 : _a.call(iterator);
      if (promise) {
        return await promise;
      }
      throw error;
    }
  };
  return stream;
}
function errorAsyncIterator(source, onError) {
  const iterator = source[Symbol.asyncIterator]();
  const stream = {
    [Symbol.asyncIterator]() {
      return stream;
    },
    async next() {
      try {
        return await iterator.next();
      } catch (error) {
        onError(error);
        return { done: true, value: void 0 };
      }
    },
    async return() {
      var _a;
      const promise = (_a = iterator.return) == null ? void 0 : _a.call(iterator);
      return promise ? await promise : { done: true, value: void 0 };
    },
    async throw(error) {
      var _a;
      const promise = (_a = iterator.throw) == null ? void 0 : _a.call(iterator);
      if (promise) {
        return await promise;
      }
      throw error;
    }
  };
  return stream;
}
function throwEngineFunctionError(name) {
  throw Error(`No \`${name}\` function found! Register it using "useEngine" plugin.`);
}
function createEnvelopOrchestrator({ plugins }) {
  let schema = null;
  let initDone = false;
  const parse2 = () => throwEngineFunctionError("parse");
  const validate2 = () => throwEngineFunctionError("validate");
  const execute2 = () => throwEngineFunctionError("execute");
  const subscribe2 = () => throwEngineFunctionError("subscribe");
  const replaceSchema = (newSchema, ignorePluginIndex = -1) => {
    schema = newSchema;
    if (initDone) {
      for (const [i, plugin] of plugins.entries()) {
        if (i !== ignorePluginIndex) {
          plugin.onSchemaChange && plugin.onSchemaChange({
            schema,
            replaceSchema: (schemaToSet) => {
              replaceSchema(schemaToSet, i);
            }
          });
        }
      }
    }
  };
  const contextErrorHandlers = [];
  for (let i = 0; i < plugins.length; i++) {
    const plugin = plugins[i];
    const pluginsToAdd = [];
    plugin.onPluginInit && plugin.onPluginInit({
      plugins,
      addPlugin: (newPlugin) => {
        pluginsToAdd.push(newPlugin);
      },
      setSchema: (modifiedSchema) => replaceSchema(modifiedSchema, i),
      registerContextErrorHandler: (handler) => contextErrorHandlers.push(handler)
    });
    pluginsToAdd.length && plugins.splice(i + 1, 0, ...pluginsToAdd);
  }
  const beforeCallbacks = {
    init: [],
    parse: [],
    validate: [],
    subscribe: [],
    execute: [],
    context: []
  };
  for (const { onContextBuilding, onExecute, onParse, onSubscribe, onValidate, onEnveloped } of plugins) {
    onEnveloped && beforeCallbacks.init.push(onEnveloped);
    onContextBuilding && beforeCallbacks.context.push(onContextBuilding);
    onExecute && beforeCallbacks.execute.push(onExecute);
    onParse && beforeCallbacks.parse.push(onParse);
    onSubscribe && beforeCallbacks.subscribe.push(onSubscribe);
    onValidate && beforeCallbacks.validate.push(onValidate);
  }
  const init = (initialContext) => {
    for (const [i, onEnveloped] of beforeCallbacks.init.entries()) {
      onEnveloped({
        context: initialContext,
        extendContext: (extension) => {
          if (!initialContext) {
            return;
          }
          Object.assign(initialContext, extension);
        },
        setSchema: (modifiedSchema) => replaceSchema(modifiedSchema, i)
      });
    }
  };
  const customParse = beforeCallbacks.parse.length ? (initialContext) => (source, parseOptions) => {
    let result = null;
    let parseFn = parse2;
    const context = initialContext;
    const afterCalls = [];
    for (const onParse of beforeCallbacks.parse) {
      const afterFn = onParse({
        context,
        extendContext: (extension) => {
          Object.assign(context, extension);
        },
        params: { source, options: parseOptions },
        parseFn,
        setParseFn: (newFn) => {
          parseFn = newFn;
        },
        setParsedDocument: (newDoc) => {
          result = newDoc;
        }
      });
      afterFn && afterCalls.push(afterFn);
    }
    if (result === null) {
      try {
        result = parseFn(source, parseOptions);
      } catch (e) {
        result = e;
      }
    }
    for (const afterCb of afterCalls) {
      afterCb({
        context,
        extendContext: (extension) => {
          Object.assign(context, extension);
        },
        replaceParseResult: (newResult) => {
          result = newResult;
        },
        result
      });
    }
    if (result === null) {
      throw new Error(`Failed to parse document.`);
    }
    if (result instanceof Error) {
      throw result;
    }
    documentStringMap.set(result, source.toString());
    return result;
  } : () => parse2;
  const customValidate = beforeCallbacks.validate.length ? (initialContext) => (schema2, documentAST, rules, typeInfo, validationOptions) => {
    let actualRules = rules ? [...rules] : void 0;
    let validateFn = validate2;
    let result = null;
    const context = initialContext;
    const afterCalls = [];
    for (const onValidate of beforeCallbacks.validate) {
      const afterFn = onValidate({
        context,
        extendContext: (extension) => {
          Object.assign(context, extension);
        },
        params: {
          schema: schema2,
          documentAST,
          rules: actualRules,
          typeInfo,
          options: validationOptions
        },
        validateFn,
        addValidationRule: (rule) => {
          if (!actualRules) {
            actualRules = [];
          }
          actualRules.push(rule);
        },
        setValidationFn: (newFn) => {
          validateFn = newFn;
        },
        setResult: (newResults) => {
          result = newResults;
        }
      });
      afterFn && afterCalls.push(afterFn);
    }
    if (!result) {
      result = validateFn(schema2, documentAST, actualRules, typeInfo, validationOptions);
    }
    if (!result) {
      return;
    }
    const valid = result.length === 0;
    for (const afterCb of afterCalls) {
      afterCb({
        valid,
        result,
        context,
        extendContext: (extension) => {
          Object.assign(context, extension);
        },
        setResult: (newResult) => {
          result = newResult;
        }
      });
    }
    return result;
  } : () => validate2;
  const customContextFactory = beforeCallbacks.context.length ? (initialContext) => async (orchestratorCtx) => {
    const afterCalls = [];
    const context = initialContext;
    if (orchestratorCtx) {
      Object.assign(context, orchestratorCtx);
    }
    try {
      let isBreakingContextBuilding = false;
      for (const onContext of beforeCallbacks.context) {
        const afterHookResult = await onContext({
          context,
          extendContext: (extension) => {
            Object.assign(context, extension);
          },
          breakContextBuilding: () => {
            isBreakingContextBuilding = true;
          }
        });
        if (typeof afterHookResult === "function") {
          afterCalls.push(afterHookResult);
        }
        if (isBreakingContextBuilding === true) {
          break;
        }
      }
      for (const afterCb of afterCalls) {
        afterCb({
          context,
          extendContext: (extension) => {
            Object.assign(context, extension);
          }
        });
      }
      return context;
    } catch (err) {
      let error = err;
      for (const errorCb of contextErrorHandlers) {
        errorCb({
          context,
          error,
          setError: (err2) => {
            error = err2;
          }
        });
      }
      throw error;
    }
  } : (initialContext) => (orchestratorCtx) => {
    if (orchestratorCtx) {
      Object.assign(initialContext, orchestratorCtx);
    }
    return initialContext;
  };
  const useCustomSubscribe = beforeCallbacks.subscribe.length;
  const customSubscribe = useCustomSubscribe ? makeSubscribe(async (args) => {
    let subscribeFn = subscribe2;
    const afterCalls = [];
    const subscribeErrorHandlers = [];
    const context = args.contextValue || {};
    let result;
    for (const onSubscribe of beforeCallbacks.subscribe) {
      const after = await onSubscribe({
        subscribeFn,
        setSubscribeFn: (newSubscribeFn) => {
          subscribeFn = newSubscribeFn;
        },
        extendContext: (extension) => {
          Object.assign(context, extension);
        },
        args,
        setResultAndStopExecution: (stopResult) => {
          result = stopResult;
        }
      });
      if (after) {
        if (after.onSubscribeResult) {
          afterCalls.push(after.onSubscribeResult);
        }
        if (after.onSubscribeError) {
          subscribeErrorHandlers.push(after.onSubscribeError);
        }
      }
      if (result !== void 0) {
        break;
      }
    }
    if (result === void 0) {
      result = await subscribeFn({
        ...args,
        contextValue: context
        // Casted for GraphQL.js 15 compatibility
        // Can be removed once we drop support for GraphQL.js 15
      });
    }
    if (!result) {
      return;
    }
    const onNextHandler = [];
    const onEndHandler = [];
    for (const afterCb of afterCalls) {
      const hookResult = afterCb({
        args,
        result,
        setResult: (newResult) => {
          result = newResult;
        }
      });
      if (hookResult) {
        if (hookResult.onNext) {
          onNextHandler.push(hookResult.onNext);
        }
        if (hookResult.onEnd) {
          onEndHandler.push(hookResult.onEnd);
        }
      }
    }
    if (onNextHandler.length && isAsyncIterable$1(result)) {
      result = mapAsyncIterator(result, async (result2) => {
        for (const onNext of onNextHandler) {
          await onNext({
            args,
            result: result2,
            setResult: (newResult) => result2 = newResult
          });
        }
        return result2;
      });
    }
    if (onEndHandler.length && isAsyncIterable$1(result)) {
      result = finalAsyncIterator(result, () => {
        for (const onEnd of onEndHandler) {
          onEnd();
        }
      });
    }
    if (subscribeErrorHandlers.length && isAsyncIterable$1(result)) {
      result = errorAsyncIterator(result, (err) => {
        let error = err;
        for (const handler of subscribeErrorHandlers) {
          handler({
            error,
            setError: (err2) => {
              error = err2;
            }
          });
        }
        throw error;
      });
    }
    return result;
  }) : makeSubscribe(subscribe2);
  const useCustomExecute = beforeCallbacks.execute.length;
  const customExecute = useCustomExecute ? makeExecute(async (args) => {
    let executeFn = execute2;
    let result;
    const afterCalls = [];
    const context = args.contextValue || {};
    for (const onExecute of beforeCallbacks.execute) {
      const after = await onExecute({
        executeFn,
        setExecuteFn: (newExecuteFn) => {
          executeFn = newExecuteFn;
        },
        setResultAndStopExecution: (stopResult) => {
          result = stopResult;
        },
        extendContext: (extension) => {
          if (typeof extension === "object") {
            Object.assign(context, extension);
          } else {
            throw new Error(`Invalid context extension provided! Expected "object", got: "${JSON.stringify(extension)}" (${typeof extension})`);
          }
        },
        args
      });
      if (after == null ? void 0 : after.onExecuteDone) {
        afterCalls.push(after.onExecuteDone);
      }
      if (result !== void 0) {
        break;
      }
    }
    if (result === void 0) {
      result = await executeFn({
        ...args,
        contextValue: context
      });
    }
    const onNextHandler = [];
    const onEndHandler = [];
    for (const afterCb of afterCalls) {
      const hookResult = await afterCb({
        args,
        result,
        setResult: (newResult) => {
          result = newResult;
        }
      });
      if (hookResult) {
        if (hookResult.onNext) {
          onNextHandler.push(hookResult.onNext);
        }
        if (hookResult.onEnd) {
          onEndHandler.push(hookResult.onEnd);
        }
      }
    }
    if (onNextHandler.length && isAsyncIterable$1(result)) {
      result = mapAsyncIterator(result, async (result2) => {
        for (const onNext of onNextHandler) {
          await onNext({
            args,
            result: result2,
            setResult: (newResult) => {
              result2 = newResult;
            }
          });
        }
        return result2;
      });
    }
    if (onEndHandler.length && isAsyncIterable$1(result)) {
      result = finalAsyncIterator(result, () => {
        for (const onEnd of onEndHandler) {
          onEnd();
        }
      });
    }
    return result;
  }) : makeExecute(execute2);
  initDone = true;
  if (schema) {
    for (const [i, plugin] of plugins.entries()) {
      plugin.onSchemaChange && plugin.onSchemaChange({
        schema,
        replaceSchema: (modifiedSchema) => replaceSchema(modifiedSchema, i)
      });
    }
  }
  return {
    getCurrentSchema() {
      return schema;
    },
    init,
    parse: customParse,
    validate: customValidate,
    execute: customExecute,
    subscribe: customSubscribe,
    contextFactory: customContextFactory
  };
}
function notEmpty(value) {
  return value != null;
}
function envelop(options) {
  const plugins = options.plugins.filter(notEmpty);
  const orchestrator = createEnvelopOrchestrator({
    plugins
  });
  const getEnveloped = (initialContext = {}) => {
    const typedOrchestrator = orchestrator;
    typedOrchestrator.init(initialContext);
    return {
      parse: typedOrchestrator.parse(initialContext),
      validate: typedOrchestrator.validate(initialContext),
      contextFactory: typedOrchestrator.contextFactory(initialContext),
      execute: typedOrchestrator.execute,
      subscribe: typedOrchestrator.subscribe,
      schema: typedOrchestrator.getCurrentSchema()
    };
  };
  getEnveloped._plugins = plugins;
  return getEnveloped;
}
const DEFAULT_ERROR_MESSAGE = "Unexpected error.";
function isGraphQLError(error) {
  return error instanceof Error && error.name === "GraphQLError";
}
function isOriginalGraphQLError(error) {
  if (isGraphQLError(error)) {
    if (error.originalError != null) {
      return isOriginalGraphQLError(error.originalError);
    }
    return true;
  }
  return false;
}
function createSerializableGraphQLError(message, originalError, isDev2) {
  const error = new Error(message);
  error.name = "GraphQLError";
  if (isDev2) {
    const extensions = originalError instanceof Error ? { message: originalError.message, stack: originalError.stack } : { message: String(originalError) };
    Object.defineProperty(error, "extensions", {
      get() {
        return extensions;
      }
    });
  }
  Object.defineProperty(error, "toJSON", {
    value() {
      return {
        message: error.message,
        extensions: error.extensions
      };
    }
  });
  return error;
}
const createDefaultMaskError = (isDev2) => (error, message) => {
  if (isOriginalGraphQLError(error)) {
    return error;
  }
  return createSerializableGraphQLError(message, error, isDev2);
};
const isDev = ((_c = (_b = globalThis.process) == null ? void 0 : _b.env) == null ? void 0 : _c.NODE_ENV) === "development";
const defaultMaskError = createDefaultMaskError(isDev);
const makeHandleResult = (maskError2, message) => ({ result, setResult }) => {
  if (result.errors != null) {
    setResult({ ...result, errors: result.errors.map((error) => maskError2(error, message)) });
  }
};
function useMaskedErrors(opts) {
  const maskError2 = (opts == null ? void 0 : opts.maskError) ?? defaultMaskError;
  const message = (opts == null ? void 0 : opts.errorMessage) || DEFAULT_ERROR_MESSAGE;
  const handleResult = makeHandleResult(maskError2, message);
  return {
    onPluginInit(context) {
      context.registerContextErrorHandler(({ error, setError }) => {
        setError(maskError2(error, message));
      });
    },
    onExecute() {
      return {
        onExecuteDone(payload) {
          return handleStreamOrSingleExecutionResult(payload, handleResult);
        }
      };
    },
    onSubscribe() {
      return {
        onSubscribeResult(payload) {
          return handleStreamOrSingleExecutionResult(payload, handleResult);
        },
        onSubscribeError({ error, setError }) {
          setError(maskError2(error, message));
        }
      };
    }
  };
}
const useExtendContext = (contextFactory) => ({
  async onContextBuilding({ context, extendContext }) {
    extendContext(await contextFactory(context));
  }
});
const useEngine = (engine) => {
  return {
    onExecute: ({ setExecuteFn }) => {
      if (engine.execute) {
        setExecuteFn(engine.execute);
      }
    },
    onParse: ({ setParseFn }) => {
      if (engine.parse) {
        setParseFn(engine.parse);
      }
    },
    onValidate: ({ setValidationFn, addValidationRule }) => {
      var _a;
      if (engine.validate) {
        setValidationFn(engine.validate);
      }
      (_a = engine.specifiedRules) == null ? void 0 : _a.map(addValidationRule);
    },
    onSubscribe: ({ setSubscribeFn }) => {
      if (engine.subscribe) {
        setSubscribeFn(engine.subscribe);
      }
    }
  };
};
function isPromiseLike(object) {
  return object != null && typeof object.then === "function";
}
const defaultOnRejectedFn = (reason) => {
  throw reason;
};
class ValueOrPromise {
  constructor(executor) {
    __publicField(this, "state");
    let value;
    try {
      value = executor();
    } catch (reason) {
      this.state = { status: "rejected", value: reason };
      return;
    }
    if (isPromiseLike(value)) {
      this.state = { status: "pending", value };
      return;
    }
    this.state = { status: "fulfilled", value };
  }
  then(onFulfilled, onRejected) {
    const state = this.state;
    if (state.status === "pending") {
      return new ValueOrPromise(() => state.value.then(onFulfilled, onRejected));
    }
    const onRejectedFn = typeof onRejected === "function" ? onRejected : defaultOnRejectedFn;
    if (state.status === "rejected") {
      return new ValueOrPromise(() => onRejectedFn(state.value));
    }
    try {
      const onFulfilledFn = typeof onFulfilled === "function" ? onFulfilled : void 0;
      return onFulfilledFn === void 0 ? new ValueOrPromise(() => state.value) : new ValueOrPromise(() => onFulfilledFn(state.value));
    } catch (e) {
      return new ValueOrPromise(() => onRejectedFn(e));
    }
  }
  catch(onRejected) {
    return this.then(void 0, onRejected);
  }
  resolve() {
    const state = this.state;
    if (state.status === "pending") {
      return Promise.resolve(state.value);
    }
    if (state.status === "rejected") {
      throw state.value;
    }
    return state.value;
  }
  static all(valueOrPromises) {
    let rejected = false;
    let reason;
    let containsPromise = false;
    const values = [];
    for (const valueOrPromise of valueOrPromises) {
      const state = valueOrPromise.state;
      if (state.status === "rejected") {
        if (rejected) {
          continue;
        }
        rejected = true;
        reason = state.value;
        continue;
      }
      if (state.status === "pending") {
        containsPromise = true;
      }
      values.push(state.value);
    }
    if (containsPromise) {
      if (rejected) {
        Promise.all(values).catch(() => {
        });
        return new ValueOrPromise(() => {
          throw reason;
        });
      }
      return new ValueOrPromise(() => Promise.all(values));
    }
    return new ValueOrPromise(() => values);
  }
}
function flattenAsyncIterable(iterable) {
  const topIterator = iterable[Symbol.asyncIterator]();
  let currentNestedIterator;
  let waitForCurrentNestedIterator;
  let done = false;
  async function next() {
    if (done) {
      return { value: void 0, done: true };
    }
    try {
      if (!currentNestedIterator) {
        if (waitForCurrentNestedIterator) {
          await waitForCurrentNestedIterator;
          return await next();
        }
        let resolve;
        waitForCurrentNestedIterator = new Promise((r) => {
          resolve = r;
        });
        const topIteratorResult = await topIterator.next();
        if (topIteratorResult.done) {
          done = true;
          return await next();
        }
        currentNestedIterator = topIteratorResult.value[Symbol.asyncIterator]();
        waitForCurrentNestedIterator = void 0;
        resolve();
        return await next();
      }
      const rememberCurrentNestedIterator = currentNestedIterator;
      const nestedIteratorResult = await currentNestedIterator.next();
      if (!nestedIteratorResult.done) {
        return nestedIteratorResult;
      }
      if (currentNestedIterator === rememberCurrentNestedIterator) {
        currentNestedIterator = void 0;
      }
      return await next();
    } catch (err) {
      done = true;
      throw err;
    }
  }
  return {
    next,
    async return() {
      var _a, _b2;
      done = true;
      await Promise.all([(_a = currentNestedIterator == null ? void 0 : currentNestedIterator.return) == null ? void 0 : _a.call(currentNestedIterator), (_b2 = topIterator.return) == null ? void 0 : _b2.call(topIterator)]);
      return { value: void 0, done: true };
    },
    async throw(error) {
      var _a, _b2;
      done = true;
      await Promise.all([(_a = currentNestedIterator == null ? void 0 : currentNestedIterator.throw) == null ? void 0 : _a.call(currentNestedIterator, error), (_b2 = topIterator.throw) == null ? void 0 : _b2.call(topIterator, error)]);
      throw error;
    },
    [Symbol.asyncIterator]() {
      return this;
    }
  };
}
function invariant(condition, message) {
  if (!condition) {
    throw new Error(message != null ? message : "Unexpected invariant triggered.");
  }
}
async function promiseForObject(object, signal) {
  const resolvedObject = /* @__PURE__ */ Object.create(null);
  await new Promise((resolve, reject) => {
    signal == null ? void 0 : signal.addEventListener("abort", () => {
      resolve();
    });
    Promise.all(Object.entries(object).map(async ([key, value]) => {
      resolvedObject[key] = await value;
    })).then(() => resolve(), reject);
  });
  return resolvedObject;
}
function getVariableValues(schema, varDefNodes, inputs, options) {
  const errors = [];
  const maxErrors = options == null ? void 0 : options.maxErrors;
  try {
    const coerced = coerceVariableValues(schema, varDefNodes, inputs, (error) => {
      if (maxErrors != null && errors.length >= maxErrors) {
        throw createGraphQLError("Too many errors processing variables, error limit reached. Execution aborted.");
      }
      errors.push(error);
    });
    if (errors.length === 0) {
      return { coerced };
    }
  } catch (error) {
    errors.push(error);
  }
  return { errors };
}
function coerceVariableValues(schema, varDefNodes, inputs, onError) {
  const coercedValues = {};
  for (const varDefNode of varDefNodes) {
    const varName = varDefNode.variable.name.value;
    const varType = typeFromAST(schema, varDefNode.type);
    if (!isInputType(varType)) {
      const varTypeStr = print(varDefNode.type);
      onError(createGraphQLError(`Variable "$${varName}" expected value of type "${varTypeStr}" which cannot be used as an input type.`, { nodes: varDefNode.type }));
      continue;
    }
    if (!hasOwnProperty(inputs, varName)) {
      if (varDefNode.defaultValue) {
        coercedValues[varName] = valueFromAST(varDefNode.defaultValue, varType);
      } else if (isNonNullType(varType)) {
        const varTypeStr = inspect(varType);
        onError(createGraphQLError(`Variable "$${varName}" of required type "${varTypeStr}" was not provided.`, {
          nodes: varDefNode
        }));
      }
      continue;
    }
    const value = inputs[varName];
    if (value === null && isNonNullType(varType)) {
      const varTypeStr = inspect(varType);
      onError(createGraphQLError(`Variable "$${varName}" of non-null type "${varTypeStr}" must not be null.`, {
        nodes: varDefNode
      }));
      continue;
    }
    coercedValues[varName] = coerceInputValue(value, varType, (path, invalidValue, error) => {
      let prefix = `Variable "$${varName}" got invalid value ` + inspect(invalidValue);
      if (path.length > 0) {
        prefix += ` at "${varName}${printPathArray(path)}"`;
      }
      onError(createGraphQLError(prefix + "; " + error.message, {
        nodes: varDefNode,
        originalError: error.originalError
      }));
    });
  }
  return coercedValues;
}
const collectSubfields2 = memoize3((exeContext, returnType, fieldNodes) => collectSubFields(exeContext.schema, exeContext.fragments, exeContext.variableValues, returnType, fieldNodes));
function execute(args) {
  const exeContext = buildExecutionContext(args);
  if (!("schema" in exeContext)) {
    return {
      errors: exeContext.map((e) => {
        var _a;
        Object.defineProperty(e, "extensions", {
          value: {
            ...e.extensions,
            http: {
              ...(_a = e.extensions) == null ? void 0 : _a["http"],
              status: 400
            }
          }
        });
        return e;
      })
    };
  }
  return executeImpl(exeContext);
}
function executeImpl(exeContext) {
  return new ValueOrPromise(() => executeOperation(exeContext)).then((data) => {
    const initialResult = buildResponse(data, exeContext.errors);
    if (exeContext.subsequentPayloads.size > 0) {
      return {
        initialResult: {
          ...initialResult,
          hasNext: true
        },
        subsequentResults: yieldSubsequentPayloads(exeContext)
      };
    }
    return initialResult;
  }, (error) => {
    exeContext.errors.push(error);
    return buildResponse(null, exeContext.errors);
  }).resolve();
}
function buildResponse(data, errors) {
  return errors.length === 0 ? { data } : { errors, data };
}
const getFragmentsFromDocument = memoize1(function getFragmentsFromDocument2(document) {
  const fragments = /* @__PURE__ */ Object.create(null);
  for (const definition of document.definitions) {
    if (definition.kind === Kind.FRAGMENT_DEFINITION) {
      fragments[definition.name.value] = definition;
    }
  }
  return fragments;
});
function buildExecutionContext(args) {
  var _a;
  const { schema, document, rootValue, contextValue, variableValues: rawVariableValues, operationName, fieldResolver, typeResolver, subscribeFieldResolver, signal } = args;
  assertValidSchema(schema);
  const fragments = getFragmentsFromDocument(document);
  let operation;
  for (const definition of document.definitions) {
    switch (definition.kind) {
      case Kind.OPERATION_DEFINITION:
        if (operationName == null) {
          if (operation !== void 0) {
            return [
              createGraphQLError("Must provide operation name if query contains multiple operations.")
            ];
          }
          operation = definition;
        } else if (((_a = definition.name) == null ? void 0 : _a.value) === operationName) {
          operation = definition;
        }
        break;
    }
  }
  if (operation == null) {
    if (operationName != null) {
      return [createGraphQLError(`Unknown operation named "${operationName}".`)];
    }
    return [createGraphQLError("Must provide an operation.")];
  }
  const variableDefinitions = operation.variableDefinitions ?? [];
  const coercedVariableValues = getVariableValues(schema, variableDefinitions, rawVariableValues ?? {}, {
    maxErrors: 50
  });
  if (coercedVariableValues.errors) {
    return coercedVariableValues.errors;
  }
  return {
    schema,
    fragments,
    rootValue,
    contextValue,
    operation,
    variableValues: coercedVariableValues.coerced,
    fieldResolver: fieldResolver ?? defaultFieldResolver,
    typeResolver: typeResolver ?? defaultTypeResolver,
    subscribeFieldResolver: subscribeFieldResolver ?? defaultFieldResolver,
    subsequentPayloads: /* @__PURE__ */ new Set(),
    errors: [],
    signal
  };
}
function buildPerEventExecutionContext(exeContext, payload) {
  return {
    ...exeContext,
    rootValue: payload,
    subsequentPayloads: /* @__PURE__ */ new Set(),
    errors: []
  };
}
function executeOperation(exeContext) {
  const { operation, schema, fragments, variableValues, rootValue } = exeContext;
  const rootType = getDefinedRootType(schema, operation.operation, [operation]);
  if (rootType == null) {
    createGraphQLError(`Schema is not configured to execute ${operation.operation} operation.`, {
      nodes: operation
    });
  }
  const { fields: rootFields, patches } = collectFields(schema, fragments, variableValues, rootType, operation.selectionSet);
  const path = void 0;
  let result;
  if (operation.operation === "mutation") {
    result = executeFieldsSerially(exeContext, rootType, rootValue, path, rootFields);
  } else {
    result = executeFields(exeContext, rootType, rootValue, path, rootFields);
  }
  for (const patch of patches) {
    const { label, fields: patchFields } = patch;
    executeDeferredFragment(exeContext, rootType, rootValue, patchFields, label, path);
  }
  return result;
}
function executeFieldsSerially(exeContext, parentType, sourceValue, path, fields) {
  let abortErrorThrown = false;
  return promiseReduce(fields, (results, [responseName, fieldNodes]) => {
    var _a;
    const fieldPath = addPath(path, responseName, parentType.name);
    if ((_a = exeContext.signal) == null ? void 0 : _a.aborted) {
      results[responseName] = null;
      return results;
    }
    return new ValueOrPromise(() => executeField(exeContext, parentType, sourceValue, fieldNodes, fieldPath)).then((result) => {
      var _a2, _b2;
      if (result === void 0) {
        return results;
      }
      results[responseName] = result;
      if (((_a2 = exeContext.signal) == null ? void 0 : _a2.aborted) && !abortErrorThrown) {
        exeContext.errors.push(createGraphQLError("Execution aborted", {
          nodes: fieldNodes,
          path: pathToArray(fieldPath),
          originalError: (_b2 = exeContext.signal) == null ? void 0 : _b2.reason
        }));
        abortErrorThrown = true;
      }
      return results;
    });
  }, /* @__PURE__ */ Object.create(null)).resolve();
}
function executeFields(exeContext, parentType, sourceValue, path, fields, asyncPayloadRecord) {
  var _a, _b2, _c2;
  const results = /* @__PURE__ */ Object.create(null);
  let containsPromise = false;
  let abortErrorThrown = false;
  try {
    for (const [responseName, fieldNodes] of fields) {
      if ((_a = exeContext.signal) == null ? void 0 : _a.aborted) {
        results[responseName] = null;
        continue;
      }
      const fieldPath = addPath(path, responseName, parentType.name);
      const result = executeField(exeContext, parentType, sourceValue, fieldNodes, fieldPath, asyncPayloadRecord);
      if (result !== void 0) {
        results[responseName] = result;
        if (isPromise$1(result)) {
          containsPromise = true;
        }
      }
      if (((_b2 = exeContext.signal) == null ? void 0 : _b2.aborted) && !abortErrorThrown) {
        exeContext.errors.push(createGraphQLError("Execution aborted", {
          nodes: fieldNodes,
          path: pathToArray(fieldPath),
          originalError: (_c2 = exeContext.signal) == null ? void 0 : _c2.reason
        }));
        abortErrorThrown = true;
      }
    }
  } catch (error) {
    if (containsPromise) {
      return promiseForObject(results, exeContext.signal).finally(() => {
        throw error;
      });
    }
    throw error;
  }
  if (!containsPromise) {
    return results;
  }
  return promiseForObject(results, exeContext.signal);
}
function executeField(exeContext, parentType, source, fieldNodes, path, asyncPayloadRecord) {
  const errors = (asyncPayloadRecord == null ? void 0 : asyncPayloadRecord.errors) ?? exeContext.errors;
  const fieldDef = getFieldDef(exeContext.schema, parentType, fieldNodes[0]);
  if (!fieldDef) {
    return;
  }
  const returnType = fieldDef.type;
  const resolveFn = fieldDef.resolve ?? exeContext.fieldResolver;
  const info = buildResolveInfo(exeContext, fieldDef, fieldNodes, parentType, path);
  try {
    const args = getArgumentValues(fieldDef, fieldNodes[0], exeContext.variableValues);
    const contextValue = exeContext.contextValue;
    const result = resolveFn(source, args, contextValue, info);
    let completed;
    if (isPromise$1(result)) {
      completed = result.then((resolved) => completeValue(exeContext, returnType, fieldNodes, info, path, resolved, asyncPayloadRecord));
    } else {
      completed = completeValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord);
    }
    if (isPromise$1(completed)) {
      return completed.then(void 0, (rawError) => {
        const error = locatedError(rawError, fieldNodes, pathToArray(path));
        const handledError = handleFieldError(error, returnType, errors);
        filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
        return handledError;
      });
    }
    return completed;
  } catch (rawError) {
    const error = locatedError(rawError, fieldNodes, pathToArray(path));
    const handledError = handleFieldError(error, returnType, errors);
    filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
    return handledError;
  }
}
function buildResolveInfo(exeContext, fieldDef, fieldNodes, parentType, path) {
  return {
    fieldName: fieldDef.name,
    fieldNodes,
    returnType: fieldDef.type,
    parentType,
    path,
    schema: exeContext.schema,
    fragments: exeContext.fragments,
    rootValue: exeContext.rootValue,
    operation: exeContext.operation,
    variableValues: exeContext.variableValues
  };
}
function handleFieldError(error, returnType, errors) {
  if (isNonNullType(returnType)) {
    throw error;
  }
  errors.push(error);
  return null;
}
function completeValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord) {
  if (result instanceof Error) {
    throw result;
  }
  if (isNonNullType(returnType)) {
    const completed = completeValue(exeContext, returnType.ofType, fieldNodes, info, path, result, asyncPayloadRecord);
    if (completed === null) {
      throw new Error(`Cannot return null for non-nullable field ${info.parentType.name}.${info.fieldName}.`);
    }
    return completed;
  }
  if (result == null) {
    return null;
  }
  if (isListType(returnType)) {
    return completeListValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord);
  }
  if (isLeafType(returnType)) {
    return completeLeafValue(returnType, result);
  }
  if (isAbstractType(returnType)) {
    return completeAbstractValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord);
  }
  if (isObjectType(returnType)) {
    return completeObjectValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord);
  }
  console.assert(false, "Cannot complete value of unexpected output type: " + inspect(returnType));
}
function getStreamValues(exeContext, fieldNodes, path) {
  if (typeof path.key === "number") {
    return;
  }
  const stream = getDirectiveValues(GraphQLStreamDirective, fieldNodes[0], exeContext.variableValues);
  if (!stream) {
    return;
  }
  if (stream.if === false) {
    return;
  }
  invariant(typeof stream["initialCount"] === "number", "initialCount must be a number");
  invariant(stream["initialCount"] >= 0, "initialCount must be a positive integer");
  return {
    initialCount: stream["initialCount"],
    label: typeof stream["label"] === "string" ? stream["label"] : void 0
  };
}
async function completeAsyncIteratorValue(exeContext, itemType, fieldNodes, info, path, iterator, asyncPayloadRecord) {
  var _a;
  (_a = exeContext.signal) == null ? void 0 : _a.addEventListener("abort", () => {
    var _a2, _b2;
    (_a2 = iterator.return) == null ? void 0 : _a2.call(iterator);
    exeContext.errors.push(createGraphQLError("Execution aborted", {
      nodes: fieldNodes,
      path: pathToArray(path),
      originalError: (_b2 = exeContext.signal) == null ? void 0 : _b2.reason
    }));
  });
  const errors = (asyncPayloadRecord == null ? void 0 : asyncPayloadRecord.errors) ?? exeContext.errors;
  const stream = getStreamValues(exeContext, fieldNodes, path);
  let containsPromise = false;
  const completedResults = [];
  let index = 0;
  while (true) {
    if (stream && typeof stream.initialCount === "number" && index >= stream.initialCount) {
      executeStreamIterator(index, iterator, exeContext, fieldNodes, info, itemType, path, stream.label, asyncPayloadRecord);
      break;
    }
    const itemPath = addPath(path, index, void 0);
    let iteration;
    try {
      iteration = await iterator.next();
      if (iteration.done) {
        break;
      }
    } catch (rawError) {
      const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
      completedResults.push(handleFieldError(error, itemType, errors));
      break;
    }
    if (completeListItemValue(iteration.value, completedResults, errors, exeContext, itemType, fieldNodes, info, itemPath, asyncPayloadRecord)) {
      containsPromise = true;
    }
    index += 1;
  }
  return containsPromise ? Promise.all(completedResults) : completedResults;
}
function completeListValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord) {
  const itemType = returnType.ofType;
  const errors = (asyncPayloadRecord == null ? void 0 : asyncPayloadRecord.errors) ?? exeContext.errors;
  if (isAsyncIterable$2(result)) {
    const iterator = result[Symbol.asyncIterator]();
    return completeAsyncIteratorValue(exeContext, itemType, fieldNodes, info, path, iterator, asyncPayloadRecord);
  }
  if (!isIterableObject(result)) {
    throw createGraphQLError(`Expected Iterable, but did not find one for field "${info.parentType.name}.${info.fieldName}".`);
  }
  const stream = getStreamValues(exeContext, fieldNodes, path);
  let containsPromise = false;
  let previousAsyncPayloadRecord = asyncPayloadRecord;
  const completedResults = [];
  let index = 0;
  for (const item of result) {
    const itemPath = addPath(path, index, void 0);
    if (stream && typeof stream.initialCount === "number" && index >= stream.initialCount) {
      previousAsyncPayloadRecord = executeStreamField(path, itemPath, item, exeContext, fieldNodes, info, itemType, stream.label, previousAsyncPayloadRecord);
      index++;
      continue;
    }
    if (completeListItemValue(item, completedResults, errors, exeContext, itemType, fieldNodes, info, itemPath, asyncPayloadRecord)) {
      containsPromise = true;
    }
    index++;
  }
  return containsPromise ? Promise.all(completedResults) : completedResults;
}
function completeListItemValue(item, completedResults, errors, exeContext, itemType, fieldNodes, info, itemPath, asyncPayloadRecord) {
  try {
    let completedItem;
    if (isPromise$1(item)) {
      completedItem = item.then((resolved) => completeValue(exeContext, itemType, fieldNodes, info, itemPath, resolved, asyncPayloadRecord));
    } else {
      completedItem = completeValue(exeContext, itemType, fieldNodes, info, itemPath, item, asyncPayloadRecord);
    }
    if (isPromise$1(completedItem)) {
      completedResults.push(completedItem.then(void 0, (rawError) => {
        const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
        const handledError = handleFieldError(error, itemType, errors);
        filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
        return handledError;
      }));
      return true;
    }
    completedResults.push(completedItem);
  } catch (rawError) {
    const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
    const handledError = handleFieldError(error, itemType, errors);
    filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
    completedResults.push(handledError);
  }
  return false;
}
function completeLeafValue(returnType, result) {
  let serializedResult;
  try {
    serializedResult = returnType.serialize(result);
  } catch (err) {
    if (err instanceof GraphQLError) {
      throw new Error(err.message);
    }
    throw err;
  }
  if (serializedResult == null) {
    throw new Error(`Expected \`${inspect(returnType)}.serialize(${inspect(result)})\` to return non-nullable value, returned: ${inspect(serializedResult)}`);
  }
  return serializedResult;
}
function completeAbstractValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord) {
  const resolveTypeFn = returnType.resolveType ?? exeContext.typeResolver;
  const contextValue = exeContext.contextValue;
  const runtimeType = resolveTypeFn(result, contextValue, info, returnType);
  if (isPromise$1(runtimeType)) {
    return runtimeType.then((resolvedRuntimeType) => completeObjectValue(exeContext, ensureValidRuntimeType(resolvedRuntimeType, exeContext, returnType, fieldNodes, info, result), fieldNodes, info, path, result, asyncPayloadRecord));
  }
  return completeObjectValue(exeContext, ensureValidRuntimeType(runtimeType, exeContext, returnType, fieldNodes, info, result), fieldNodes, info, path, result, asyncPayloadRecord);
}
function ensureValidRuntimeType(runtimeTypeName, exeContext, returnType, fieldNodes, info, result) {
  if (runtimeTypeName == null) {
    throw createGraphQLError(`Abstract type "${returnType.name}" must resolve to an Object type at runtime for field "${info.parentType.name}.${info.fieldName}". Either the "${returnType.name}" type should provide a "resolveType" function or each possible type should provide an "isTypeOf" function.`, { nodes: fieldNodes });
  }
  if (isObjectType(runtimeTypeName)) {
    throw createGraphQLError("Support for returning GraphQLObjectType from resolveType was removed in graphql-js@16.0.0 please return type name instead.");
  }
  if (typeof runtimeTypeName !== "string") {
    throw createGraphQLError(`Abstract type "${returnType.name}" must resolve to an Object type at runtime for field "${info.parentType.name}.${info.fieldName}" with value ${inspect(result)}, received "${inspect(runtimeTypeName)}".`);
  }
  const runtimeType = exeContext.schema.getType(runtimeTypeName);
  if (runtimeType == null) {
    throw createGraphQLError(`Abstract type "${returnType.name}" was resolved to a type "${runtimeTypeName}" that does not exist inside the schema.`, { nodes: fieldNodes });
  }
  if (!isObjectType(runtimeType)) {
    throw createGraphQLError(`Abstract type "${returnType.name}" was resolved to a non-object type "${runtimeTypeName}".`, { nodes: fieldNodes });
  }
  if (!exeContext.schema.isSubType(returnType, runtimeType)) {
    throw createGraphQLError(`Runtime Object type "${runtimeType.name}" is not a possible type for "${returnType.name}".`, { nodes: fieldNodes });
  }
  return runtimeType;
}
function completeObjectValue(exeContext, returnType, fieldNodes, info, path, result, asyncPayloadRecord) {
  if (returnType.isTypeOf) {
    const isTypeOf = returnType.isTypeOf(result, exeContext.contextValue, info);
    if (isPromise$1(isTypeOf)) {
      return isTypeOf.then((resolvedIsTypeOf) => {
        if (!resolvedIsTypeOf) {
          throw invalidReturnTypeError(returnType, result, fieldNodes);
        }
        return collectAndExecuteSubfields(exeContext, returnType, fieldNodes, path, result, asyncPayloadRecord);
      });
    }
    if (!isTypeOf) {
      throw invalidReturnTypeError(returnType, result, fieldNodes);
    }
  }
  return collectAndExecuteSubfields(exeContext, returnType, fieldNodes, path, result, asyncPayloadRecord);
}
function invalidReturnTypeError(returnType, result, fieldNodes) {
  return createGraphQLError(`Expected value of type "${returnType.name}" but got: ${inspect(result)}.`, {
    nodes: fieldNodes
  });
}
function collectAndExecuteSubfields(exeContext, returnType, fieldNodes, path, result, asyncPayloadRecord) {
  const { fields: subFieldNodes, patches: subPatches } = collectSubfields2(exeContext, returnType, fieldNodes);
  const subFields = executeFields(exeContext, returnType, result, path, subFieldNodes, asyncPayloadRecord);
  for (const subPatch of subPatches) {
    const { label, fields: subPatchFieldNodes } = subPatch;
    executeDeferredFragment(exeContext, returnType, result, subPatchFieldNodes, label, path, asyncPayloadRecord);
  }
  return subFields;
}
const defaultTypeResolver = function(value, contextValue, info, abstractType) {
  if (isObjectLike(value) && typeof value["__typename"] === "string") {
    return value["__typename"];
  }
  const possibleTypes = info.schema.getPossibleTypes(abstractType);
  const promisedIsTypeOfResults = [];
  for (let i = 0; i < possibleTypes.length; i++) {
    const type = possibleTypes[i];
    if (type.isTypeOf) {
      const isTypeOfResult = type.isTypeOf(value, contextValue, info);
      if (isPromise$1(isTypeOfResult)) {
        promisedIsTypeOfResults[i] = isTypeOfResult;
      } else if (isTypeOfResult) {
        return type.name;
      }
    }
  }
  if (promisedIsTypeOfResults.length) {
    return Promise.all(promisedIsTypeOfResults).then((isTypeOfResults) => {
      for (let i = 0; i < isTypeOfResults.length; i++) {
        if (isTypeOfResults[i]) {
          return possibleTypes[i].name;
        }
      }
    });
  }
};
const defaultFieldResolver = function(source, args, contextValue, info) {
  if (isObjectLike(source) || typeof source === "function") {
    const property = source[info.fieldName];
    if (typeof property === "function") {
      return source[info.fieldName](args, contextValue, info);
    }
    return property;
  }
};
function subscribe(args) {
  const exeContext = buildExecutionContext(args);
  if (!("schema" in exeContext)) {
    return {
      errors: exeContext.map((e) => {
        var _a;
        Object.defineProperty(e, "extensions", {
          value: {
            ...e.extensions,
            http: {
              ...(_a = e.extensions) == null ? void 0 : _a["http"],
              status: 400
            }
          }
        });
        return e;
      })
    };
  }
  const resultOrStream = createSourceEventStreamImpl(exeContext);
  if (isPromise$1(resultOrStream)) {
    return resultOrStream.then((resolvedResultOrStream) => mapSourceToResponse(exeContext, resolvedResultOrStream));
  }
  return mapSourceToResponse(exeContext, resultOrStream);
}
function flattenIncrementalResults(incrementalResults, signal) {
  const subsequentIterator = incrementalResults.subsequentResults;
  let initialResultSent = false;
  let done = false;
  signal == null ? void 0 : signal.addEventListener("abort", () => {
    var _a;
    done = true;
    (_a = subsequentIterator.throw) == null ? void 0 : _a.call(subsequentIterator, signal == null ? void 0 : signal.reason);
  });
  return {
    [Symbol.asyncIterator]() {
      return this;
    },
    next() {
      if (done) {
        return Promise.resolve({
          value: void 0,
          done
        });
      }
      if (initialResultSent) {
        return subsequentIterator.next();
      }
      initialResultSent = true;
      return Promise.resolve({
        value: incrementalResults.initialResult,
        done
      });
    },
    return() {
      done = true;
      return subsequentIterator.return();
    },
    throw(error) {
      done = true;
      return subsequentIterator.throw(error);
    }
  };
}
async function* ensureAsyncIterable(someExecutionResult, signal) {
  if ("initialResult" in someExecutionResult) {
    yield* flattenIncrementalResults(someExecutionResult, signal);
  } else {
    yield someExecutionResult;
  }
}
function mapSourceToResponse(exeContext, resultOrStream) {
  if (!isAsyncIterable$2(resultOrStream)) {
    return resultOrStream;
  }
  return flattenAsyncIterable(mapAsyncIterator$1(resultOrStream[Symbol.asyncIterator](), async (payload) => ensureAsyncIterable(await executeImpl(buildPerEventExecutionContext(exeContext, payload)), exeContext.signal), async function* (error) {
    const wrappedError = createGraphQLError(error.message, {
      originalError: error,
      nodes: [exeContext.operation]
    });
    yield {
      errors: [wrappedError]
    };
  }));
}
function createSourceEventStreamImpl(exeContext) {
  try {
    const eventStream = executeSubscription(exeContext);
    if (isPromise$1(eventStream)) {
      return eventStream.then(void 0, (error) => ({ errors: [error] }));
    }
    return eventStream;
  } catch (error) {
    return { errors: [error] };
  }
}
function executeSubscription(exeContext) {
  const { schema, fragments, operation, variableValues, rootValue } = exeContext;
  const rootType = schema.getSubscriptionType();
  if (rootType == null) {
    throw createGraphQLError("Schema is not configured to execute subscription operation.", {
      nodes: operation
    });
  }
  const { fields: rootFields } = collectFields(schema, fragments, variableValues, rootType, operation.selectionSet);
  const [responseName, fieldNodes] = [...rootFields.entries()][0];
  const fieldName = fieldNodes[0].name.value;
  const fieldDef = getFieldDef(schema, rootType, fieldNodes[0]);
  if (!fieldDef) {
    throw createGraphQLError(`The subscription field "${fieldName}" is not defined.`, {
      nodes: fieldNodes
    });
  }
  const path = addPath(void 0, responseName, rootType.name);
  const info = buildResolveInfo(exeContext, fieldDef, fieldNodes, rootType, path);
  try {
    const args = getArgumentValues(fieldDef, fieldNodes[0], variableValues);
    const contextValue = exeContext.contextValue;
    const resolveFn = fieldDef.subscribe ?? exeContext.subscribeFieldResolver;
    const result = resolveFn(rootValue, args, contextValue, info);
    if (isPromise$1(result)) {
      return result.then(assertEventStream).then(void 0, (error) => {
        throw locatedError(error, fieldNodes, pathToArray(path));
      });
    }
    return assertEventStream(result, exeContext.signal);
  } catch (error) {
    throw locatedError(error, fieldNodes, pathToArray(path));
  }
}
function assertEventStream(result, signal) {
  if (result instanceof Error) {
    throw result;
  }
  if (!isAsyncIterable$2(result)) {
    throw createGraphQLError(`Subscription field must return Async Iterable. Received: ${inspect(result)}.`);
  }
  return {
    [Symbol.asyncIterator]() {
      const asyncIterator = result[Symbol.asyncIterator]();
      signal == null ? void 0 : signal.addEventListener("abort", () => {
        var _a;
        (_a = asyncIterator.return) == null ? void 0 : _a.call(asyncIterator);
      });
      return asyncIterator;
    }
  };
}
function executeDeferredFragment(exeContext, parentType, sourceValue, fields, label, path, parentContext) {
  const asyncPayloadRecord = new DeferredFragmentRecord({
    label,
    path,
    parentContext,
    exeContext
  });
  let promiseOrData;
  try {
    promiseOrData = executeFields(exeContext, parentType, sourceValue, path, fields, asyncPayloadRecord);
    if (isPromise$1(promiseOrData)) {
      promiseOrData = promiseOrData.then(null, (e) => {
        asyncPayloadRecord.errors.push(e);
        return null;
      });
    }
  } catch (e) {
    asyncPayloadRecord.errors.push(e);
    promiseOrData = null;
  }
  asyncPayloadRecord.addData(promiseOrData);
}
function executeStreamField(path, itemPath, item, exeContext, fieldNodes, info, itemType, label, parentContext) {
  const asyncPayloadRecord = new StreamRecord({
    label,
    path: itemPath,
    parentContext,
    exeContext
  });
  let completedItem;
  try {
    try {
      if (isPromise$1(item)) {
        completedItem = item.then((resolved) => completeValue(exeContext, itemType, fieldNodes, info, itemPath, resolved, asyncPayloadRecord));
      } else {
        completedItem = completeValue(exeContext, itemType, fieldNodes, info, itemPath, item, asyncPayloadRecord);
      }
      if (isPromise$1(completedItem)) {
        completedItem = completedItem.then(void 0, (rawError) => {
          const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
          const handledError = handleFieldError(error, itemType, asyncPayloadRecord.errors);
          filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
          return handledError;
        });
      }
    } catch (rawError) {
      const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
      completedItem = handleFieldError(error, itemType, asyncPayloadRecord.errors);
      filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
    }
  } catch (error) {
    asyncPayloadRecord.errors.push(error);
    filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
    asyncPayloadRecord.addItems(null);
    return asyncPayloadRecord;
  }
  let completedItems;
  if (isPromise$1(completedItem)) {
    completedItems = completedItem.then((value) => [value], (error) => {
      asyncPayloadRecord.errors.push(error);
      filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
      return null;
    });
  } else {
    completedItems = [completedItem];
  }
  asyncPayloadRecord.addItems(completedItems);
  return asyncPayloadRecord;
}
async function executeStreamIteratorItem(iterator, exeContext, fieldNodes, info, itemType, asyncPayloadRecord, itemPath) {
  let item;
  try {
    const { value, done } = await iterator.next();
    if (done) {
      asyncPayloadRecord.setIsCompletedIterator();
      return { done, value: void 0 };
    }
    item = value;
  } catch (rawError) {
    const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
    const value = handleFieldError(error, itemType, asyncPayloadRecord.errors);
    return { done: true, value };
  }
  let completedItem;
  try {
    completedItem = completeValue(exeContext, itemType, fieldNodes, info, itemPath, item, asyncPayloadRecord);
    if (isPromise$1(completedItem)) {
      completedItem = completedItem.then(void 0, (rawError) => {
        const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
        const handledError = handleFieldError(error, itemType, asyncPayloadRecord.errors);
        filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
        return handledError;
      });
    }
    return { done: false, value: completedItem };
  } catch (rawError) {
    const error = locatedError(rawError, fieldNodes, pathToArray(itemPath));
    const value = handleFieldError(error, itemType, asyncPayloadRecord.errors);
    filterSubsequentPayloads(exeContext, itemPath, asyncPayloadRecord);
    return { done: false, value };
  }
}
async function executeStreamIterator(initialIndex, iterator, exeContext, fieldNodes, info, itemType, path, label, parentContext) {
  let index = initialIndex;
  let previousAsyncPayloadRecord = parentContext ?? void 0;
  while (true) {
    const itemPath = addPath(path, index, void 0);
    const asyncPayloadRecord = new StreamRecord({
      label,
      path: itemPath,
      parentContext: previousAsyncPayloadRecord,
      iterator,
      exeContext
    });
    let iteration;
    try {
      iteration = await executeStreamIteratorItem(iterator, exeContext, fieldNodes, info, itemType, asyncPayloadRecord, itemPath);
    } catch (error) {
      asyncPayloadRecord.errors.push(error);
      filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
      asyncPayloadRecord.addItems(null);
      if (iterator == null ? void 0 : iterator.return) {
        iterator.return().catch(() => {
        });
      }
      return;
    }
    const { done, value: completedItem } = iteration;
    let completedItems;
    if (isPromise$1(completedItem)) {
      completedItems = completedItem.then((value) => [value], (error) => {
        asyncPayloadRecord.errors.push(error);
        filterSubsequentPayloads(exeContext, path, asyncPayloadRecord);
        return null;
      });
    } else {
      completedItems = [completedItem];
    }
    asyncPayloadRecord.addItems(completedItems);
    if (done) {
      break;
    }
    previousAsyncPayloadRecord = asyncPayloadRecord;
    index++;
  }
}
function filterSubsequentPayloads(exeContext, nullPath, currentAsyncRecord) {
  const nullPathArray = pathToArray(nullPath);
  exeContext.subsequentPayloads.forEach((asyncRecord) => {
    var _a;
    if (asyncRecord === currentAsyncRecord) {
      return;
    }
    for (let i = 0; i < nullPathArray.length; i++) {
      if (asyncRecord.path[i] !== nullPathArray[i]) {
        return;
      }
    }
    if (isStreamPayload(asyncRecord) && ((_a = asyncRecord.iterator) == null ? void 0 : _a.return)) {
      asyncRecord.iterator.return().catch(() => {
      });
    }
    exeContext.subsequentPayloads.delete(asyncRecord);
  });
}
function getCompletedIncrementalResults(exeContext) {
  const incrementalResults = [];
  for (const asyncPayloadRecord of exeContext.subsequentPayloads) {
    const incrementalResult = {};
    if (!asyncPayloadRecord.isCompleted) {
      continue;
    }
    exeContext.subsequentPayloads.delete(asyncPayloadRecord);
    if (isStreamPayload(asyncPayloadRecord)) {
      const items = asyncPayloadRecord.items;
      if (asyncPayloadRecord.isCompletedIterator) {
        continue;
      }
      incrementalResult.items = items;
    } else {
      const data = asyncPayloadRecord.data;
      incrementalResult.data = data ?? null;
    }
    incrementalResult.path = asyncPayloadRecord.path;
    if (asyncPayloadRecord.label) {
      incrementalResult.label = asyncPayloadRecord.label;
    }
    if (asyncPayloadRecord.errors.length > 0) {
      incrementalResult.errors = asyncPayloadRecord.errors;
    }
    incrementalResults.push(incrementalResult);
  }
  return incrementalResults;
}
function yieldSubsequentPayloads(exeContext) {
  let isDone = false;
  async function next() {
    if (isDone) {
      return { value: void 0, done: true };
    }
    await Promise.race(Array.from(exeContext.subsequentPayloads).map((p) => p.promise));
    if (isDone) {
      return { value: void 0, done: true };
    }
    const incremental = getCompletedIncrementalResults(exeContext);
    const hasNext = exeContext.subsequentPayloads.size > 0;
    if (!incremental.length && hasNext) {
      return next();
    }
    if (!hasNext) {
      isDone = true;
    }
    return {
      value: incremental.length ? { incremental, hasNext } : { hasNext },
      done: false
    };
  }
  function returnStreamIterators() {
    const promises = [];
    exeContext.subsequentPayloads.forEach((asyncPayloadRecord) => {
      var _a;
      if (isStreamPayload(asyncPayloadRecord) && ((_a = asyncPayloadRecord.iterator) == null ? void 0 : _a.return)) {
        promises.push(asyncPayloadRecord.iterator.return());
      }
    });
    return Promise.all(promises);
  }
  return {
    [Symbol.asyncIterator]() {
      return this;
    },
    next,
    async return() {
      await returnStreamIterators();
      isDone = true;
      return { value: void 0, done: true };
    },
    async throw(error) {
      await returnStreamIterators();
      isDone = true;
      return Promise.reject(error);
    }
  };
}
class DeferredFragmentRecord {
  constructor(opts) {
    this.type = "defer";
    this.label = opts.label;
    this.path = pathToArray(opts.path);
    this.parentContext = opts.parentContext;
    this.errors = [];
    this._exeContext = opts.exeContext;
    this._exeContext.subsequentPayloads.add(this);
    this.isCompleted = false;
    this.data = null;
    this.promise = new Promise((resolve) => {
      this._resolve = (MaybePromise) => {
        resolve(MaybePromise);
      };
    }).then((data) => {
      this.data = data;
      this.isCompleted = true;
    });
  }
  addData(data) {
    var _a, _b2, _c2;
    const parentData = (_a = this.parentContext) == null ? void 0 : _a.promise;
    if (parentData) {
      (_b2 = this._resolve) == null ? void 0 : _b2.call(this, parentData.then(() => data));
      return;
    }
    (_c2 = this._resolve) == null ? void 0 : _c2.call(this, data);
  }
}
class StreamRecord {
  constructor(opts) {
    this.type = "stream";
    this.items = null;
    this.label = opts.label;
    this.path = pathToArray(opts.path);
    this.parentContext = opts.parentContext;
    this.iterator = opts.iterator;
    this.errors = [];
    this._exeContext = opts.exeContext;
    this._exeContext.subsequentPayloads.add(this);
    this.isCompleted = false;
    this.items = null;
    this.promise = new Promise((resolve) => {
      this._resolve = (MaybePromise) => {
        resolve(MaybePromise);
      };
    }).then((items) => {
      this.items = items;
      this.isCompleted = true;
    });
  }
  addItems(items) {
    var _a, _b2, _c2;
    const parentData = (_a = this.parentContext) == null ? void 0 : _a.promise;
    if (parentData) {
      (_b2 = this._resolve) == null ? void 0 : _b2.call(this, parentData.then(() => items));
      return;
    }
    (_c2 = this._resolve) == null ? void 0 : _c2.call(this, items);
  }
  setIsCompletedIterator() {
    this.isCompletedIterator = true;
  }
}
function isStreamPayload(asyncPayload) {
  return asyncPayload.type === "stream";
}
function getFieldDef(schema, parentType, fieldNode) {
  const fieldName = fieldNode.name.value;
  if (fieldName === SchemaMetaFieldDef.name && schema.getQueryType() === parentType) {
    return SchemaMetaFieldDef;
  } else if (fieldName === TypeMetaFieldDef.name && schema.getQueryType() === parentType) {
    return TypeMetaFieldDef;
  } else if (fieldName === TypeNameMetaFieldDef.name) {
    return TypeNameMetaFieldDef;
  }
  return parentType.getFields()[fieldName];
}
function normalizedExecutor(args) {
  const operationAST = getOperationAST(args.document, args.operationName);
  if (operationAST == null) {
    throw new Error("Must provide an operation.");
  }
  if (operationAST.operation === "subscription") {
    return subscribe(args);
  }
  return new ValueOrPromise(() => execute(args)).then((result) => {
    if ("initialResult" in result) {
      return flattenIncrementalResults(result, args.signal);
    }
    return result;
  }).resolve();
}
function getAugmentedNamespace(n) {
  if (n.__esModule)
    return n;
  var f = n.default;
  if (typeof f == "function") {
    var a = function a2() {
      if (this instanceof a2) {
        return Reflect.construct(f, arguments, this.constructor);
      }
      return f.apply(this, arguments);
    };
    a.prototype = f.prototype;
  } else
    a = {};
  Object.defineProperty(a, "__esModule", { value: true });
  Object.keys(n).forEach(function(k) {
    var d = Object.getOwnPropertyDescriptor(n, k);
    Object.defineProperty(a, k, d.get ? d : {
      enumerable: true,
      get: function() {
        return n[k];
      }
    });
  });
  return a;
}
function commonjsRequire(path) {
  throw new Error('Could not dynamically require "' + path + '". Please configure the dynamicRequireTargets or/and ignoreDynamicRequires option of @rollup/plugin-commonjs appropriately for this require call to work.');
}
var nodePonyfill = {};
function isNextJs() {
  return Object.keys(globalThis).some((key) => key.startsWith("__NEXT"));
}
var shouldSkipPonyfill$2 = function shouldSkipPonyfill() {
  if (globalThis.Deno) {
    return true;
  }
  if (process.versions.bun) {
    return true;
  }
  if (isNextJs()) {
    return true;
  }
  return false;
};
var urlpattern;
var hasRequiredUrlpattern;
function requireUrlpattern() {
  var _i, _n, _t, _e2, _s, _l, _o, _d2, _p, _g, _r, r_fn, _R, R_fn, _b2, b_fn, _u, u_fn, _m, m_fn, _a, a_fn, _P, P_fn, _E, E_fn, _S, S_fn, _O, O_fn, _k, k_fn, _x, x_fn, _h, h_fn, _f, f_fn, _T, T_fn, _A, A_fn, _y, y_fn, _w, w_fn, _c2, c_fn, _C, C_fn, _a2, _i2, _n2, _t2, _e3, _s2, _l2, _b3;
  if (hasRequiredUrlpattern)
    return urlpattern;
  hasRequiredUrlpattern = 1;
  var M = Object.defineProperty;
  var Pe = Object.getOwnPropertyDescriptor;
  var Re = Object.getOwnPropertyNames;
  var Ee = Object.prototype.hasOwnProperty;
  var Oe = (e, t) => {
    for (var r in t)
      M(e, r, { get: t[r], enumerable: true });
  }, ke = (e, t, r, n) => {
    if (t && typeof t == "object" || typeof t == "function")
      for (let a of Re(t))
        !Ee.call(e, a) && a !== r && M(e, a, { get: () => t[a], enumerable: !(n = Pe(t, a)) || n.enumerable });
    return e;
  };
  var Te = (e) => ke(M({}, "__esModule", { value: true }), e);
  var Ne = {};
  Oe(Ne, { URLPattern: () => Y });
  urlpattern = Te(Ne);
  var R = class {
    constructor(t, r, n, a, c, l) {
      __publicField(this, "type", 3);
      __publicField(this, "name", "");
      __publicField(this, "prefix", "");
      __publicField(this, "value", "");
      __publicField(this, "suffix", "");
      __publicField(this, "modifier", 3);
      this.type = t, this.name = r, this.prefix = n, this.value = a, this.suffix = c, this.modifier = l;
    }
    hasCustomName() {
      return this.name !== "" && typeof this.name != "number";
    }
  }, Ae = /[$_\p{ID_Start}]/u, ye = /[$_\u200C\u200D\p{ID_Continue}]/u, v = ".*";
  function we(e, t) {
    return (t ? /^[\x00-\xFF]*$/ : /^[\x00-\x7F]*$/).test(e);
  }
  function D(e, t = false) {
    let r = [], n = 0;
    for (; n < e.length; ) {
      let a = e[n], c = function(l) {
        if (!t)
          throw new TypeError(l);
        r.push({ type: "INVALID_CHAR", index: n, value: e[n++] });
      };
      if (a === "*") {
        r.push({ type: "ASTERISK", index: n, value: e[n++] });
        continue;
      }
      if (a === "+" || a === "?") {
        r.push({ type: "OTHER_MODIFIER", index: n, value: e[n++] });
        continue;
      }
      if (a === "\\") {
        r.push({ type: "ESCAPED_CHAR", index: n++, value: e[n++] });
        continue;
      }
      if (a === "{") {
        r.push({ type: "OPEN", index: n, value: e[n++] });
        continue;
      }
      if (a === "}") {
        r.push({ type: "CLOSE", index: n, value: e[n++] });
        continue;
      }
      if (a === ":") {
        let l = "", s = n + 1;
        for (; s < e.length; ) {
          let i = e.substr(s, 1);
          if (s === n + 1 && Ae.test(i) || s !== n + 1 && ye.test(i)) {
            l += e[s++];
            continue;
          }
          break;
        }
        if (!l) {
          c(`Missing parameter name at ${n}`);
          continue;
        }
        r.push({ type: "NAME", index: n, value: l }), n = s;
        continue;
      }
      if (a === "(") {
        let l = 1, s = "", i = n + 1, o = false;
        if (e[i] === "?") {
          c(`Pattern cannot start with "?" at ${i}`);
          continue;
        }
        for (; i < e.length; ) {
          if (!we(e[i], false)) {
            c(`Invalid character '${e[i]}' at ${i}.`), o = true;
            break;
          }
          if (e[i] === "\\") {
            s += e[i++] + e[i++];
            continue;
          }
          if (e[i] === ")") {
            if (l--, l === 0) {
              i++;
              break;
            }
          } else if (e[i] === "(" && (l++, e[i + 1] !== "?")) {
            c(`Capturing groups are not allowed at ${i}`), o = true;
            break;
          }
          s += e[i++];
        }
        if (o)
          continue;
        if (l) {
          c(`Unbalanced pattern at ${n}`);
          continue;
        }
        if (!s) {
          c(`Missing pattern at ${n}`);
          continue;
        }
        r.push({ type: "REGEX", index: n, value: s }), n = i;
        continue;
      }
      r.push({ type: "CHAR", index: n, value: e[n++] });
    }
    return r.push({ type: "END", index: n, value: "" }), r;
  }
  function F(e, t = {}) {
    let r = D(e);
    t.delimiter ?? (t.delimiter = "/#?"), t.prefixes ?? (t.prefixes = "./");
    let n = `[^${S(t.delimiter)}]+?`, a = [], c = 0, l = 0, i = /* @__PURE__ */ new Set(), o = (h) => {
      if (l < r.length && r[l].type === h)
        return r[l++].value;
    }, f = () => o("OTHER_MODIFIER") ?? o("ASTERISK"), d = (h) => {
      let u = o(h);
      if (u !== void 0)
        return u;
      let { type: p, index: A } = r[l];
      throw new TypeError(`Unexpected ${p} at ${A}, expected ${h}`);
    }, T = () => {
      let h = "", u;
      for (; u = o("CHAR") ?? o("ESCAPED_CHAR"); )
        h += u;
      return h;
    }, xe = (h) => h, L = t.encodePart || xe, I = "", U = (h) => {
      I += h;
    }, $ = () => {
      I.length && (a.push(new R(3, "", "", L(I), "", 3)), I = "");
    }, X = (h, u, p, A, Z) => {
      let g = 3;
      switch (Z) {
        case "?":
          g = 1;
          break;
        case "*":
          g = 0;
          break;
        case "+":
          g = 2;
          break;
      }
      if (!u && !p && g === 3) {
        U(h);
        return;
      }
      if ($(), !u && !p) {
        if (!h)
          return;
        a.push(new R(3, "", "", L(h), "", g));
        return;
      }
      let m;
      p ? p === "*" ? m = v : m = p : m = n;
      let O = 2;
      m === n ? (O = 1, m = "") : m === v && (O = 0, m = "");
      let P;
      if (u ? P = u : p && (P = c++), i.has(P))
        throw new TypeError(`Duplicate name '${P}'.`);
      i.add(P), a.push(new R(O, P, L(h), m, L(A), g));
    };
    for (; l < r.length; ) {
      let h = o("CHAR"), u = o("NAME"), p = o("REGEX");
      if (!u && !p && (p = o("ASTERISK")), u || p) {
        let g = h ?? "";
        t.prefixes.indexOf(g) === -1 && (U(g), g = ""), $();
        let m = f();
        X(g, u, p, "", m);
        continue;
      }
      let A = h ?? o("ESCAPED_CHAR");
      if (A) {
        U(A);
        continue;
      }
      if (o("OPEN")) {
        let g = T(), m = o("NAME"), O = o("REGEX");
        !m && !O && (O = o("ASTERISK"));
        let P = T();
        d("CLOSE");
        let be = f();
        X(g, m, O, P, be);
        continue;
      }
      $(), d("END");
    }
    return a;
  }
  function S(e) {
    return e.replace(/([.+*?^${}()[\]|/\\])/g, "\\$1");
  }
  function B(e) {
    return e && e.ignoreCase ? "ui" : "u";
  }
  function q(e, t, r) {
    return W(F(e, r), t, r);
  }
  function k(e) {
    switch (e) {
      case 0:
        return "*";
      case 1:
        return "?";
      case 2:
        return "+";
      case 3:
        return "";
    }
  }
  function W(e, t, r = {}) {
    r.delimiter ?? (r.delimiter = "/#?"), r.prefixes ?? (r.prefixes = "./"), r.sensitive ?? (r.sensitive = false), r.strict ?? (r.strict = false), r.end ?? (r.end = true), r.start ?? (r.start = true), r.endsWith = "";
    let n = r.start ? "^" : "";
    for (let s of e) {
      if (s.type === 3) {
        s.modifier === 3 ? n += S(s.value) : n += `(?:${S(s.value)})${k(s.modifier)}`;
        continue;
      }
      t && t.push(s.name);
      let i = `[^${S(r.delimiter)}]+?`, o = s.value;
      if (s.type === 1 ? o = i : s.type === 0 && (o = v), !s.prefix.length && !s.suffix.length) {
        s.modifier === 3 || s.modifier === 1 ? n += `(${o})${k(s.modifier)}` : n += `((?:${o})${k(s.modifier)})`;
        continue;
      }
      if (s.modifier === 3 || s.modifier === 1) {
        n += `(?:${S(s.prefix)}(${o})${S(s.suffix)})`, n += k(s.modifier);
        continue;
      }
      n += `(?:${S(s.prefix)}`, n += `((?:${o})(?:`, n += S(s.suffix), n += S(s.prefix), n += `(?:${o}))*)${S(s.suffix)})`, s.modifier === 0 && (n += "?");
    }
    let a = `[${S(r.endsWith)}]|$`, c = `[${S(r.delimiter)}]`;
    if (r.end)
      return r.strict || (n += `${c}?`), r.endsWith.length ? n += `(?=${a})` : n += "$", new RegExp(n, B(r));
    r.strict || (n += `(?:${c}(?=${a}))?`);
    let l = false;
    if (e.length) {
      let s = e[e.length - 1];
      s.type === 3 && s.modifier === 3 && (l = r.delimiter.indexOf(s) > -1);
    }
    return l || (n += `(?=${c}|${a})`), new RegExp(n, B(r));
  }
  var x = { delimiter: "", prefixes: "", sensitive: true, strict: true }, J = { delimiter: ".", prefixes: "", sensitive: true, strict: true }, Q = { delimiter: "/", prefixes: "/", sensitive: true, strict: true };
  function ee(e, t) {
    return e.length ? e[0] === "/" ? true : !t || e.length < 2 ? false : (e[0] == "\\" || e[0] == "{") && e[1] == "/" : false;
  }
  function te(e, t) {
    return e.startsWith(t) ? e.substring(t.length, e.length) : e;
  }
  function Ce(e, t) {
    return e.endsWith(t) ? e.substr(0, e.length - t.length) : e;
  }
  function _(e) {
    return !e || e.length < 2 ? false : e[0] === "[" || (e[0] === "\\" || e[0] === "{") && e[1] === "[";
  }
  var re = ["ftp", "file", "http", "https", "ws", "wss"];
  function N(e) {
    if (!e)
      return true;
    for (let t of re)
      if (e.test(t))
        return true;
    return false;
  }
  function ne(e, t) {
    if (e = te(e, "#"), t || e === "")
      return e;
    let r = new URL("https://example.com");
    return r.hash = e, r.hash ? r.hash.substring(1, r.hash.length) : "";
  }
  function se(e, t) {
    if (e = te(e, "?"), t || e === "")
      return e;
    let r = new URL("https://example.com");
    return r.search = e, r.search ? r.search.substring(1, r.search.length) : "";
  }
  function ie(e, t) {
    return t || e === "" ? e : _(e) ? K(e) : j(e);
  }
  function ae(e, t) {
    if (t || e === "")
      return e;
    let r = new URL("https://example.com");
    return r.password = e, r.password;
  }
  function oe(e, t) {
    if (t || e === "")
      return e;
    let r = new URL("https://example.com");
    return r.username = e, r.username;
  }
  function ce(e, t, r) {
    if (r || e === "")
      return e;
    if (t && !re.includes(t))
      return new URL(`${t}:${e}`).pathname;
    let n = e[0] == "/";
    return e = new URL(n ? e : "/-" + e, "https://example.com").pathname, n || (e = e.substring(2, e.length)), e;
  }
  function le(e, t, r) {
    return z(t) === e && (e = ""), r || e === "" ? e : G(e);
  }
  function fe(e, t) {
    return e = Ce(e, ":"), t || e === "" ? e : y(e);
  }
  function z(e) {
    switch (e) {
      case "ws":
      case "http":
        return "80";
      case "wws":
      case "https":
        return "443";
      case "ftp":
        return "21";
      default:
        return "";
    }
  }
  function y(e) {
    if (e === "")
      return e;
    if (/^[-+.A-Za-z0-9]*$/.test(e))
      return e.toLowerCase();
    throw new TypeError(`Invalid protocol '${e}'.`);
  }
  function he(e) {
    if (e === "")
      return e;
    let t = new URL("https://example.com");
    return t.username = e, t.username;
  }
  function ue(e) {
    if (e === "")
      return e;
    let t = new URL("https://example.com");
    return t.password = e, t.password;
  }
  function j(e) {
    if (e === "")
      return e;
    if (/[\t\n\r #%/:<>?@[\]^\\|]/g.test(e))
      throw new TypeError(`Invalid hostname '${e}'`);
    let t = new URL("https://example.com");
    return t.hostname = e, t.hostname;
  }
  function K(e) {
    if (e === "")
      return e;
    if (/[^0-9a-fA-F[\]:]/g.test(e))
      throw new TypeError(`Invalid IPv6 hostname '${e}'`);
    return e.toLowerCase();
  }
  function G(e) {
    if (e === "" || /^[0-9]*$/.test(e) && parseInt(e) <= 65535)
      return e;
    throw new TypeError(`Invalid port '${e}'.`);
  }
  function de(e) {
    if (e === "")
      return e;
    let t = new URL("https://example.com");
    return t.pathname = e[0] !== "/" ? "/-" + e : e, e[0] !== "/" ? t.pathname.substring(2, t.pathname.length) : t.pathname;
  }
  function pe(e) {
    return e === "" ? e : new URL(`data:${e}`).pathname;
  }
  function ge(e) {
    if (e === "")
      return e;
    let t = new URL("https://example.com");
    return t.search = e, t.search.substring(1, t.search.length);
  }
  function me(e) {
    if (e === "")
      return e;
    let t = new URL("https://example.com");
    return t.hash = e, t.hash.substring(1, t.hash.length);
  }
  var H = (_a2 = class {
    constructor(t) {
      __privateAdd(this, _r);
      __privateAdd(this, _R);
      __privateAdd(this, _b2);
      __privateAdd(this, _u);
      __privateAdd(this, _m);
      __privateAdd(this, _a);
      __privateAdd(this, _P);
      __privateAdd(this, _E);
      __privateAdd(this, _S);
      __privateAdd(this, _O);
      __privateAdd(this, _k);
      __privateAdd(this, _x);
      __privateAdd(this, _h);
      __privateAdd(this, _f);
      __privateAdd(this, _T);
      __privateAdd(this, _A);
      __privateAdd(this, _y);
      __privateAdd(this, _w);
      __privateAdd(this, _c2);
      __privateAdd(this, _C);
      __privateAdd(this, _i, void 0);
      __privateAdd(this, _n, []);
      __privateAdd(this, _t, {});
      __privateAdd(this, _e2, 0);
      __privateAdd(this, _s, 1);
      __privateAdd(this, _l, 0);
      __privateAdd(this, _o, 0);
      __privateAdd(this, _d2, 0);
      __privateAdd(this, _p, 0);
      __privateAdd(this, _g, false);
      __privateSet(this, _i, t);
    }
    get result() {
      return __privateGet(this, _t);
    }
    parse() {
      for (__privateSet(this, _n, D(__privateGet(this, _i), true)); __privateGet(this, _e2) < __privateGet(this, _n).length; __privateSet(this, _e2, __privateGet(this, _e2) + __privateGet(this, _s))) {
        if (__privateSet(this, _s, 1), __privateGet(this, _n)[__privateGet(this, _e2)].type === "END") {
          if (__privateGet(this, _o) === 0) {
            __privateMethod(this, _b2, b_fn).call(this), __privateMethod(this, _f, f_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 9, 1) : __privateMethod(this, _h, h_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 8, 1) : __privateMethod(this, _r, r_fn).call(this, 7, 0);
            continue;
          } else if (__privateGet(this, _o) === 2) {
            __privateMethod(this, _u, u_fn).call(this, 5);
            continue;
          }
          __privateMethod(this, _r, r_fn).call(this, 10, 0);
          break;
        }
        if (__privateGet(this, _d2) > 0)
          if (__privateMethod(this, _A, A_fn).call(this))
            __privateSet(this, _d2, __privateGet(this, _d2) - 1);
          else
            continue;
        if (__privateMethod(this, _T, T_fn).call(this)) {
          __privateSet(this, _d2, __privateGet(this, _d2) + 1);
          continue;
        }
        switch (__privateGet(this, _o)) {
          case 0:
            __privateMethod(this, _P, P_fn).call(this) && __privateMethod(this, _u, u_fn).call(this, 1);
            break;
          case 1:
            if (__privateMethod(this, _P, P_fn).call(this)) {
              __privateMethod(this, _C, C_fn).call(this);
              let t = 7, r = 1;
              __privateMethod(this, _E, E_fn).call(this) ? (t = 2, r = 3) : __privateGet(this, _g) && (t = 2), __privateMethod(this, _r, r_fn).call(this, t, r);
            }
            break;
          case 2:
            __privateMethod(this, _S, S_fn).call(this) ? __privateMethod(this, _u, u_fn).call(this, 3) : (__privateMethod(this, _x, x_fn).call(this) || __privateMethod(this, _h, h_fn).call(this) || __privateMethod(this, _f, f_fn).call(this)) && __privateMethod(this, _u, u_fn).call(this, 5);
            break;
          case 3:
            __privateMethod(this, _O, O_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 4, 1) : __privateMethod(this, _S, S_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 5, 1);
            break;
          case 4:
            __privateMethod(this, _S, S_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 5, 1);
            break;
          case 5:
            __privateMethod(this, _y, y_fn).call(this) ? __privateSet(this, _p, __privateGet(this, _p) + 1) : __privateMethod(this, _w, w_fn).call(this) && __privateSet(this, _p, __privateGet(this, _p) - 1), __privateMethod(this, _k, k_fn).call(this) && !__privateGet(this, _p) ? __privateMethod(this, _r, r_fn).call(this, 6, 1) : __privateMethod(this, _x, x_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 7, 0) : __privateMethod(this, _h, h_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 8, 1) : __privateMethod(this, _f, f_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 9, 1);
            break;
          case 6:
            __privateMethod(this, _x, x_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 7, 0) : __privateMethod(this, _h, h_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 8, 1) : __privateMethod(this, _f, f_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 9, 1);
            break;
          case 7:
            __privateMethod(this, _h, h_fn).call(this) ? __privateMethod(this, _r, r_fn).call(this, 8, 1) : __privateMethod(this, _f, f_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 9, 1);
            break;
          case 8:
            __privateMethod(this, _f, f_fn).call(this) && __privateMethod(this, _r, r_fn).call(this, 9, 1);
            break;
        }
      }
      __privateGet(this, _t).hostname !== void 0 && __privateGet(this, _t).port === void 0 && (__privateGet(this, _t).port = "");
    }
  }, _i = new WeakMap(), _n = new WeakMap(), _t = new WeakMap(), _e2 = new WeakMap(), _s = new WeakMap(), _l = new WeakMap(), _o = new WeakMap(), _d2 = new WeakMap(), _p = new WeakMap(), _g = new WeakMap(), _r = new WeakSet(), r_fn = function(t, r) {
    var _a3, _b4, _c3;
    switch (__privateGet(this, _o)) {
      case 0:
        break;
      case 1:
        __privateGet(this, _t).protocol = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 2:
        break;
      case 3:
        __privateGet(this, _t).username = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 4:
        __privateGet(this, _t).password = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 5:
        __privateGet(this, _t).hostname = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 6:
        __privateGet(this, _t).port = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 7:
        __privateGet(this, _t).pathname = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 8:
        __privateGet(this, _t).search = __privateMethod(this, _c2, c_fn).call(this);
        break;
      case 9:
        __privateGet(this, _t).hash = __privateMethod(this, _c2, c_fn).call(this);
        break;
    }
    __privateGet(this, _o) !== 0 && t !== 10 && ([1, 2, 3, 4].includes(__privateGet(this, _o)) && [6, 7, 8, 9].includes(t) && ((_a3 = __privateGet(this, _t)).hostname ?? (_a3.hostname = "")), [1, 2, 3, 4, 5, 6].includes(__privateGet(this, _o)) && [8, 9].includes(t) && ((_b4 = __privateGet(this, _t)).pathname ?? (_b4.pathname = __privateGet(this, _g) ? "/" : "")), [1, 2, 3, 4, 5, 6, 7].includes(__privateGet(this, _o)) && t === 9 && ((_c3 = __privateGet(this, _t)).search ?? (_c3.search = ""))), __privateMethod(this, _R, R_fn).call(this, t, r);
  }, _R = new WeakSet(), R_fn = function(t, r) {
    __privateSet(this, _o, t), __privateSet(this, _l, __privateGet(this, _e2) + r), __privateSet(this, _e2, __privateGet(this, _e2) + r), __privateSet(this, _s, 0);
  }, _b2 = new WeakSet(), b_fn = function() {
    __privateSet(this, _e2, __privateGet(this, _l)), __privateSet(this, _s, 0);
  }, _u = new WeakSet(), u_fn = function(t) {
    __privateMethod(this, _b2, b_fn).call(this), __privateSet(this, _o, t);
  }, _m = new WeakSet(), m_fn = function(t) {
    return t < 0 && (t = __privateGet(this, _n).length - t), t < __privateGet(this, _n).length ? __privateGet(this, _n)[t] : __privateGet(this, _n)[__privateGet(this, _n).length - 1];
  }, _a = new WeakSet(), a_fn = function(t, r) {
    let n = __privateMethod(this, _m, m_fn).call(this, t);
    return n.value === r && (n.type === "CHAR" || n.type === "ESCAPED_CHAR" || n.type === "INVALID_CHAR");
  }, _P = new WeakSet(), P_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), ":");
  }, _E = new WeakSet(), E_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2) + 1, "/") && __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2) + 2, "/");
  }, _S = new WeakSet(), S_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "@");
  }, _O = new WeakSet(), O_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), ":");
  }, _k = new WeakSet(), k_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), ":");
  }, _x = new WeakSet(), x_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "/");
  }, _h = new WeakSet(), h_fn = function() {
    if (__privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "?"))
      return true;
    if (__privateGet(this, _n)[__privateGet(this, _e2)].value !== "?")
      return false;
    let t = __privateMethod(this, _m, m_fn).call(this, __privateGet(this, _e2) - 1);
    return t.type !== "NAME" && t.type !== "REGEX" && t.type !== "CLOSE" && t.type !== "ASTERISK";
  }, _f = new WeakSet(), f_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "#");
  }, _T = new WeakSet(), T_fn = function() {
    return __privateGet(this, _n)[__privateGet(this, _e2)].type == "OPEN";
  }, _A = new WeakSet(), A_fn = function() {
    return __privateGet(this, _n)[__privateGet(this, _e2)].type == "CLOSE";
  }, _y = new WeakSet(), y_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "[");
  }, _w = new WeakSet(), w_fn = function() {
    return __privateMethod(this, _a, a_fn).call(this, __privateGet(this, _e2), "]");
  }, _c2 = new WeakSet(), c_fn = function() {
    let t = __privateGet(this, _n)[__privateGet(this, _e2)], r = __privateMethod(this, _m, m_fn).call(this, __privateGet(this, _l)).index;
    return __privateGet(this, _i).substring(r, t.index);
  }, _C = new WeakSet(), C_fn = function() {
    let t = {};
    Object.assign(t, x), t.encodePart = y;
    let r = q(__privateMethod(this, _c2, c_fn).call(this), void 0, t);
    __privateSet(this, _g, N(r));
  }, _a2);
  var V = ["protocol", "username", "password", "hostname", "port", "pathname", "search", "hash"], E = "*";
  function Se(e, t) {
    if (typeof e != "string")
      throw new TypeError("parameter 1 is not of type 'string'.");
    let r = new URL(e, t);
    return { protocol: r.protocol.substring(0, r.protocol.length - 1), username: r.username, password: r.password, hostname: r.hostname, port: r.port, pathname: r.pathname, search: r.search !== "" ? r.search.substring(1, r.search.length) : void 0, hash: r.hash !== "" ? r.hash.substring(1, r.hash.length) : void 0 };
  }
  function b(e, t) {
    return t ? C(e) : e;
  }
  function w(e, t, r) {
    let n;
    if (typeof t.baseURL == "string")
      try {
        n = new URL(t.baseURL), t.protocol === void 0 && (e.protocol = b(n.protocol.substring(0, n.protocol.length - 1), r)), !r && t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && t.username === void 0 && (e.username = b(n.username, r)), !r && t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && t.username === void 0 && t.password === void 0 && (e.password = b(n.password, r)), t.protocol === void 0 && t.hostname === void 0 && (e.hostname = b(n.hostname, r)), t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && (e.port = b(n.port, r)), t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && t.pathname === void 0 && (e.pathname = b(n.pathname, r)), t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && t.pathname === void 0 && t.search === void 0 && (e.search = b(n.search.substring(1, n.search.length), r)), t.protocol === void 0 && t.hostname === void 0 && t.port === void 0 && t.pathname === void 0 && t.search === void 0 && t.hash === void 0 && (e.hash = b(n.hash.substring(1, n.hash.length), r));
      } catch {
        throw new TypeError(`invalid baseURL '${t.baseURL}'.`);
      }
    if (typeof t.protocol == "string" && (e.protocol = fe(t.protocol, r)), typeof t.username == "string" && (e.username = oe(t.username, r)), typeof t.password == "string" && (e.password = ae(t.password, r)), typeof t.hostname == "string" && (e.hostname = ie(t.hostname, r)), typeof t.port == "string" && (e.port = le(t.port, e.protocol, r)), typeof t.pathname == "string") {
      if (e.pathname = t.pathname, n && !ee(e.pathname, r)) {
        let a = n.pathname.lastIndexOf("/");
        a >= 0 && (e.pathname = b(n.pathname.substring(0, a + 1), r) + e.pathname);
      }
      e.pathname = ce(e.pathname, e.protocol, r);
    }
    return typeof t.search == "string" && (e.search = se(t.search, r)), typeof t.hash == "string" && (e.hash = ne(t.hash, r)), e;
  }
  function C(e) {
    return e.replace(/([+*?:{}()\\])/g, "\\$1");
  }
  function Le(e) {
    return e.replace(/([.+*?^${}()[\]|/\\])/g, "\\$1");
  }
  function Ie(e, t) {
    t.delimiter ?? (t.delimiter = "/#?"), t.prefixes ?? (t.prefixes = "./"), t.sensitive ?? (t.sensitive = false), t.strict ?? (t.strict = false), t.end ?? (t.end = true), t.start ?? (t.start = true), t.endsWith = "";
    let r = ".*", n = `[^${Le(t.delimiter)}]+?`, a = /[$_\u200C\u200D\p{ID_Continue}]/u, c = "";
    for (let l = 0; l < e.length; ++l) {
      let s = e[l];
      if (s.type === 3) {
        if (s.modifier === 3) {
          c += C(s.value);
          continue;
        }
        c += `{${C(s.value)}}${k(s.modifier)}`;
        continue;
      }
      let i = s.hasCustomName(), o = !!s.suffix.length || !!s.prefix.length && (s.prefix.length !== 1 || !t.prefixes.includes(s.prefix)), f = l > 0 ? e[l - 1] : null, d = l < e.length - 1 ? e[l + 1] : null;
      if (!o && i && s.type === 1 && s.modifier === 3 && d && !d.prefix.length && !d.suffix.length)
        if (d.type === 3) {
          let T = d.value.length > 0 ? d.value[0] : "";
          o = a.test(T);
        } else
          o = !d.hasCustomName();
      if (!o && !s.prefix.length && f && f.type === 3) {
        let T = f.value[f.value.length - 1];
        o = t.prefixes.includes(T);
      }
      o && (c += "{"), c += C(s.prefix), i && (c += `:${s.name}`), s.type === 2 ? c += `(${s.value})` : s.type === 1 ? i || (c += `(${n})`) : s.type === 0 && (!i && (!f || f.type === 3 || f.modifier !== 3 || o || s.prefix !== "") ? c += "*" : c += `(${r})`), s.type === 1 && i && s.suffix.length && a.test(s.suffix[0]) && (c += "\\"), c += C(s.suffix), o && (c += "}"), s.modifier !== 3 && (c += k(s.modifier));
    }
    return c;
  }
  var Y = (_b3 = class {
    constructor(t = {}, r, n) {
      __privateAdd(this, _i2, void 0);
      __privateAdd(this, _n2, {});
      __privateAdd(this, _t2, {});
      __privateAdd(this, _e3, {});
      __privateAdd(this, _s2, {});
      __privateAdd(this, _l2, false);
      try {
        let a;
        if (typeof r == "string" ? a = r : n = r, typeof t == "string") {
          let i = new H(t);
          if (i.parse(), t = i.result, a === void 0 && typeof t.protocol != "string")
            throw new TypeError("A base URL must be provided for a relative constructor string.");
          t.baseURL = a;
        } else {
          if (!t || typeof t != "object")
            throw new TypeError("parameter 1 is not of type 'string' and cannot convert to dictionary.");
          if (a)
            throw new TypeError("parameter 1 is not of type 'string'.");
        }
        typeof n > "u" && (n = { ignoreCase: false });
        let c = { ignoreCase: n.ignoreCase === true }, l = { pathname: E, protocol: E, username: E, password: E, hostname: E, port: E, search: E, hash: E };
        __privateSet(this, _i2, w(l, t, true)), z(__privateGet(this, _i2).protocol) === __privateGet(this, _i2).port && (__privateGet(this, _i2).port = "");
        let s;
        for (s of V) {
          if (!(s in __privateGet(this, _i2)))
            continue;
          let i = {}, o = __privateGet(this, _i2)[s];
          switch (__privateGet(this, _t2)[s] = [], s) {
            case "protocol":
              Object.assign(i, x), i.encodePart = y;
              break;
            case "username":
              Object.assign(i, x), i.encodePart = he;
              break;
            case "password":
              Object.assign(i, x), i.encodePart = ue;
              break;
            case "hostname":
              Object.assign(i, J), _(o) ? i.encodePart = K : i.encodePart = j;
              break;
            case "port":
              Object.assign(i, x), i.encodePart = G;
              break;
            case "pathname":
              N(__privateGet(this, _n2).protocol) ? (Object.assign(i, Q, c), i.encodePart = de) : (Object.assign(i, x, c), i.encodePart = pe);
              break;
            case "search":
              Object.assign(i, x, c), i.encodePart = ge;
              break;
            case "hash":
              Object.assign(i, x, c), i.encodePart = me;
              break;
          }
          try {
            __privateGet(this, _s2)[s] = F(o, i), __privateGet(this, _n2)[s] = W(__privateGet(this, _s2)[s], __privateGet(this, _t2)[s], i), __privateGet(this, _e3)[s] = Ie(__privateGet(this, _s2)[s], i), __privateSet(this, _l2, __privateGet(this, _l2) || __privateGet(this, _s2)[s].some((f) => f.type === 2));
          } catch {
            throw new TypeError(`invalid ${s} pattern '${__privateGet(this, _i2)[s]}'.`);
          }
        }
      } catch (a) {
        throw new TypeError(`Failed to construct 'URLPattern': ${a.message}`);
      }
    }
    test(t = {}, r) {
      let n = { pathname: "", protocol: "", username: "", password: "", hostname: "", port: "", search: "", hash: "" };
      if (typeof t != "string" && r)
        throw new TypeError("parameter 1 is not of type 'string'.");
      if (typeof t > "u")
        return false;
      try {
        typeof t == "object" ? n = w(n, t, false) : n = w(n, Se(t, r), false);
      } catch {
        return false;
      }
      let a;
      for (a of V)
        if (!__privateGet(this, _n2)[a].exec(n[a]))
          return false;
      return true;
    }
    exec(t = {}, r) {
      let n = { pathname: "", protocol: "", username: "", password: "", hostname: "", port: "", search: "", hash: "" };
      if (typeof t != "string" && r)
        throw new TypeError("parameter 1 is not of type 'string'.");
      if (typeof t > "u")
        return;
      try {
        typeof t == "object" ? n = w(n, t, false) : n = w(n, Se(t, r), false);
      } catch {
        return null;
      }
      let a = {};
      r ? a.inputs = [t, r] : a.inputs = [t];
      let c;
      for (c of V) {
        let l = __privateGet(this, _n2)[c].exec(n[c]);
        if (!l)
          return null;
        let s = {};
        for (let [i, o] of __privateGet(this, _t2)[c].entries())
          if (typeof o == "string" || typeof o == "number") {
            let f = l[i + 1];
            s[o] = f;
          }
        a[c] = { input: n[c] ?? "", groups: s };
      }
      return a;
    }
    static compareComponent(t, r, n) {
      let a = (i, o) => {
        for (let f of ["type", "modifier", "prefix", "value", "suffix"]) {
          if (i[f] < o[f])
            return -1;
          if (i[f] === o[f])
            continue;
          return 1;
        }
        return 0;
      }, c = new R(3, "", "", "", "", 3), l = new R(0, "", "", "", "", 3), s = (i, o) => {
        let f = 0;
        for (; f < Math.min(i.length, o.length); ++f) {
          let d = a(i[f], o[f]);
          if (d)
            return d;
        }
        return i.length === o.length ? 0 : a(i[f] ?? c, o[f] ?? c);
      };
      return !__privateGet(r, _e3)[t] && !__privateGet(n, _e3)[t] ? 0 : __privateGet(r, _e3)[t] && !__privateGet(n, _e3)[t] ? s(__privateGet(r, _s2)[t], [l]) : !__privateGet(r, _e3)[t] && __privateGet(n, _e3)[t] ? s([l], __privateGet(n, _s2)[t]) : s(__privateGet(r, _s2)[t], __privateGet(n, _s2)[t]);
    }
    get protocol() {
      return __privateGet(this, _e3).protocol;
    }
    get username() {
      return __privateGet(this, _e3).username;
    }
    get password() {
      return __privateGet(this, _e3).password;
    }
    get hostname() {
      return __privateGet(this, _e3).hostname;
    }
    get port() {
      return __privateGet(this, _e3).port;
    }
    get pathname() {
      return __privateGet(this, _e3).pathname;
    }
    get search() {
      return __privateGet(this, _e3).search;
    }
    get hash() {
      return __privateGet(this, _e3).hash;
    }
    get hasRegExpGroups() {
      return __privateGet(this, _l2);
    }
  }, _i2 = new WeakMap(), _n2 = new WeakMap(), _t2 = new WeakMap(), _e3 = new WeakMap(), _s2 = new WeakMap(), _l2 = new WeakMap(), _b3);
  return urlpattern;
}
var urlpatternPolyfill;
var hasRequiredUrlpatternPolyfill;
function requireUrlpatternPolyfill() {
  if (hasRequiredUrlpatternPolyfill)
    return urlpatternPolyfill;
  hasRequiredUrlpatternPolyfill = 1;
  const { URLPattern: URLPattern2 } = requireUrlpattern();
  urlpatternPolyfill = { URLPattern: URLPattern2 };
  if (!globalThis.URLPattern) {
    globalThis.URLPattern = URLPattern2;
  }
  return urlpatternPolyfill;
}
var cjs = {};
var fetch$2 = {};
var fetchCurl = {};
var Response$1 = {};
var Body = {};
var extendStatics = function(d, b) {
  extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
    d2.__proto__ = b2;
  } || function(d2, b2) {
    for (var p in b2)
      if (Object.prototype.hasOwnProperty.call(b2, p))
        d2[p] = b2[p];
  };
  return extendStatics(d, b);
};
function __extends(d, b) {
  if (typeof b !== "function" && b !== null)
    throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
  extendStatics(d, b);
  function __() {
    this.constructor = d;
  }
  d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}
var __assign = function() {
  __assign = Object.assign || function __assign2(t) {
    for (var s, i = 1, n = arguments.length; i < n; i++) {
      s = arguments[i];
      for (var p in s)
        if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
    }
    return t;
  };
  return __assign.apply(this, arguments);
};
function __rest(s, e) {
  var t = {};
  for (var p in s)
    if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
      t[p] = s[p];
  if (s != null && typeof Object.getOwnPropertySymbols === "function")
    for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
      if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
        t[p[i]] = s[p[i]];
    }
  return t;
}
function __decorate(decorators, target, key, desc) {
  var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
  if (typeof Reflect === "object" && typeof Reflect.decorate === "function")
    r = Reflect.decorate(decorators, target, key, desc);
  else
    for (var i = decorators.length - 1; i >= 0; i--)
      if (d = decorators[i])
        r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
  return c > 3 && r && Object.defineProperty(target, key, r), r;
}
function __param(paramIndex, decorator) {
  return function(target, key) {
    decorator(target, key, paramIndex);
  };
}
function __esDecorate(ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
  function accept(f) {
    if (f !== void 0 && typeof f !== "function")
      throw new TypeError("Function expected");
    return f;
  }
  var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
  var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
  var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
  var _, done = false;
  for (var i = decorators.length - 1; i >= 0; i--) {
    var context = {};
    for (var p in contextIn)
      context[p] = p === "access" ? {} : contextIn[p];
    for (var p in contextIn.access)
      context.access[p] = contextIn.access[p];
    context.addInitializer = function(f) {
      if (done)
        throw new TypeError("Cannot add initializers after decoration has completed");
      extraInitializers.push(accept(f || null));
    };
    var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
    if (kind === "accessor") {
      if (result === void 0)
        continue;
      if (result === null || typeof result !== "object")
        throw new TypeError("Object expected");
      if (_ = accept(result.get))
        descriptor.get = _;
      if (_ = accept(result.set))
        descriptor.set = _;
      if (_ = accept(result.init))
        initializers.unshift(_);
    } else if (_ = accept(result)) {
      if (kind === "field")
        initializers.unshift(_);
      else
        descriptor[key] = _;
    }
  }
  if (target)
    Object.defineProperty(target, contextIn.name, descriptor);
  done = true;
}
function __runInitializers(thisArg, initializers, value) {
  var useValue = arguments.length > 2;
  for (var i = 0; i < initializers.length; i++) {
    value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
  }
  return useValue ? value : void 0;
}
function __propKey(x) {
  return typeof x === "symbol" ? x : "".concat(x);
}
function __setFunctionName(f, name, prefix) {
  if (typeof name === "symbol")
    name = name.description ? "[".concat(name.description, "]") : "";
  return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
}
function __metadata(metadataKey, metadataValue) {
  if (typeof Reflect === "object" && typeof Reflect.metadata === "function")
    return Reflect.metadata(metadataKey, metadataValue);
}
function __awaiter(thisArg, _arguments, P, generator) {
  function adopt(value) {
    return value instanceof P ? value : new P(function(resolve) {
      resolve(value);
    });
  }
  return new (P || (P = Promise))(function(resolve, reject) {
    function fulfilled(value) {
      try {
        step(generator.next(value));
      } catch (e) {
        reject(e);
      }
    }
    function rejected(value) {
      try {
        step(generator["throw"](value));
      } catch (e) {
        reject(e);
      }
    }
    function step(result) {
      result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected);
    }
    step((generator = generator.apply(thisArg, _arguments || [])).next());
  });
}
function __generator(thisArg, body) {
  var _ = { label: 0, sent: function() {
    if (t[0] & 1)
      throw t[1];
    return t[1];
  }, trys: [], ops: [] }, f, y, t, g;
  return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() {
    return this;
  }), g;
  function verb(n) {
    return function(v) {
      return step([n, v]);
    };
  }
  function step(op) {
    if (f)
      throw new TypeError("Generator is already executing.");
    while (g && (g = 0, op[0] && (_ = 0)), _)
      try {
        if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done)
          return t;
        if (y = 0, t)
          op = [op[0] & 2, t.value];
        switch (op[0]) {
          case 0:
          case 1:
            t = op;
            break;
          case 4:
            _.label++;
            return { value: op[1], done: false };
          case 5:
            _.label++;
            y = op[1];
            op = [0];
            continue;
          case 7:
            op = _.ops.pop();
            _.trys.pop();
            continue;
          default:
            if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) {
              _ = 0;
              continue;
            }
            if (op[0] === 3 && (!t || op[1] > t[0] && op[1] < t[3])) {
              _.label = op[1];
              break;
            }
            if (op[0] === 6 && _.label < t[1]) {
              _.label = t[1];
              t = op;
              break;
            }
            if (t && _.label < t[2]) {
              _.label = t[2];
              _.ops.push(op);
              break;
            }
            if (t[2])
              _.ops.pop();
            _.trys.pop();
            continue;
        }
        op = body.call(thisArg, _);
      } catch (e) {
        op = [6, e];
        y = 0;
      } finally {
        f = t = 0;
      }
    if (op[0] & 5)
      throw op[1];
    return { value: op[0] ? op[1] : void 0, done: true };
  }
}
var __createBinding = Object.create ? function(o, m, k, k2) {
  if (k2 === void 0)
    k2 = k;
  var desc = Object.getOwnPropertyDescriptor(m, k);
  if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
    desc = { enumerable: true, get: function() {
      return m[k];
    } };
  }
  Object.defineProperty(o, k2, desc);
} : function(o, m, k, k2) {
  if (k2 === void 0)
    k2 = k;
  o[k2] = m[k];
};
function __exportStar(m, o) {
  for (var p in m)
    if (p !== "default" && !Object.prototype.hasOwnProperty.call(o, p))
      __createBinding(o, m, p);
}
function __values(o) {
  var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
  if (m)
    return m.call(o);
  if (o && typeof o.length === "number")
    return {
      next: function() {
        if (o && i >= o.length)
          o = void 0;
        return { value: o && o[i++], done: !o };
      }
    };
  throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
}
function __read(o, n) {
  var m = typeof Symbol === "function" && o[Symbol.iterator];
  if (!m)
    return o;
  var i = m.call(o), r, ar = [], e;
  try {
    while ((n === void 0 || n-- > 0) && !(r = i.next()).done)
      ar.push(r.value);
  } catch (error) {
    e = { error };
  } finally {
    try {
      if (r && !r.done && (m = i["return"]))
        m.call(i);
    } finally {
      if (e)
        throw e.error;
    }
  }
  return ar;
}
function __spread() {
  for (var ar = [], i = 0; i < arguments.length; i++)
    ar = ar.concat(__read(arguments[i]));
  return ar;
}
function __spreadArrays() {
  for (var s = 0, i = 0, il = arguments.length; i < il; i++)
    s += arguments[i].length;
  for (var r = Array(s), k = 0, i = 0; i < il; i++)
    for (var a = arguments[i], j = 0, jl = a.length; j < jl; j++, k++)
      r[k] = a[j];
  return r;
}
function __spreadArray(to, from, pack) {
  if (pack || arguments.length === 2)
    for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar)
          ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
  return to.concat(ar || Array.prototype.slice.call(from));
}
function __await(v) {
  return this instanceof __await ? (this.v = v, this) : new __await(v);
}
function __asyncGenerator(thisArg, _arguments, generator) {
  if (!Symbol.asyncIterator)
    throw new TypeError("Symbol.asyncIterator is not defined.");
  var g = generator.apply(thisArg, _arguments || []), i, q = [];
  return i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function() {
    return this;
  }, i;
  function verb(n) {
    if (g[n])
      i[n] = function(v) {
        return new Promise(function(a, b) {
          q.push([n, v, a, b]) > 1 || resume(n, v);
        });
      };
  }
  function resume(n, v) {
    try {
      step(g[n](v));
    } catch (e) {
      settle(q[0][3], e);
    }
  }
  function step(r) {
    r.value instanceof __await ? Promise.resolve(r.value.v).then(fulfill, reject) : settle(q[0][2], r);
  }
  function fulfill(value) {
    resume("next", value);
  }
  function reject(value) {
    resume("throw", value);
  }
  function settle(f, v) {
    if (f(v), q.shift(), q.length)
      resume(q[0][0], q[0][1]);
  }
}
function __asyncDelegator(o) {
  var i, p;
  return i = {}, verb("next"), verb("throw", function(e) {
    throw e;
  }), verb("return"), i[Symbol.iterator] = function() {
    return this;
  }, i;
  function verb(n, f) {
    i[n] = o[n] ? function(v) {
      return (p = !p) ? { value: __await(o[n](v)), done: false } : f ? f(v) : v;
    } : f;
  }
}
function __asyncValues(o) {
  if (!Symbol.asyncIterator)
    throw new TypeError("Symbol.asyncIterator is not defined.");
  var m = o[Symbol.asyncIterator], i;
  return m ? m.call(o) : (o = typeof __values === "function" ? __values(o) : o[Symbol.iterator](), i = {}, verb("next"), verb("throw"), verb("return"), i[Symbol.asyncIterator] = function() {
    return this;
  }, i);
  function verb(n) {
    i[n] = o[n] && function(v) {
      return new Promise(function(resolve, reject) {
        v = o[n](v), settle(resolve, reject, v.done, v.value);
      });
    };
  }
  function settle(resolve, reject, d, v) {
    Promise.resolve(v).then(function(v2) {
      resolve({ value: v2, done: d });
    }, reject);
  }
}
function __makeTemplateObject(cooked, raw) {
  if (Object.defineProperty) {
    Object.defineProperty(cooked, "raw", { value: raw });
  } else {
    cooked.raw = raw;
  }
  return cooked;
}
var __setModuleDefault = Object.create ? function(o, v) {
  Object.defineProperty(o, "default", { enumerable: true, value: v });
} : function(o, v) {
  o["default"] = v;
};
function __importStar(mod) {
  if (mod && mod.__esModule)
    return mod;
  var result = {};
  if (mod != null) {
    for (var k in mod)
      if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
        __createBinding(result, mod, k);
  }
  __setModuleDefault(result, mod);
  return result;
}
function __importDefault(mod) {
  return mod && mod.__esModule ? mod : { default: mod };
}
function __classPrivateFieldGet(receiver, state, kind, f) {
  if (kind === "a" && !f)
    throw new TypeError("Private accessor was defined without a getter");
  if (typeof state === "function" ? receiver !== state || !f : !state.has(receiver))
    throw new TypeError("Cannot read private member from an object whose class did not declare it");
  return kind === "m" ? f : kind === "a" ? f.call(receiver) : f ? f.value : state.get(receiver);
}
function __classPrivateFieldSet(receiver, state, value, kind, f) {
  if (kind === "m")
    throw new TypeError("Private method is not writable");
  if (kind === "a" && !f)
    throw new TypeError("Private accessor was defined without a setter");
  if (typeof state === "function" ? receiver !== state || !f : !state.has(receiver))
    throw new TypeError("Cannot write private member to an object whose class did not declare it");
  return kind === "a" ? f.call(receiver, value) : f ? f.value = value : state.set(receiver, value), value;
}
function __classPrivateFieldIn(state, receiver) {
  if (receiver === null || typeof receiver !== "object" && typeof receiver !== "function")
    throw new TypeError("Cannot use 'in' operator on non-object");
  return typeof state === "function" ? receiver === state : state.has(receiver);
}
function __addDisposableResource(env, value, async) {
  if (value !== null && value !== void 0) {
    if (typeof value !== "object" && typeof value !== "function")
      throw new TypeError("Object expected.");
    var dispose;
    if (async) {
      if (!Symbol.asyncDispose)
        throw new TypeError("Symbol.asyncDispose is not defined.");
      dispose = value[Symbol.asyncDispose];
    }
    if (dispose === void 0) {
      if (!Symbol.dispose)
        throw new TypeError("Symbol.dispose is not defined.");
      dispose = value[Symbol.dispose];
    }
    if (typeof dispose !== "function")
      throw new TypeError("Object not disposable.");
    env.stack.push({ value, dispose, async });
  } else if (async) {
    env.stack.push({ async: true });
  }
  return value;
}
var _SuppressedError = typeof SuppressedError === "function" ? SuppressedError : function(error, suppressed, message) {
  var e = new Error(message);
  return e.name = "SuppressedError", e.error = error, e.suppressed = suppressed, e;
};
function __disposeResources(env) {
  function fail(e) {
    env.error = env.hasError ? new _SuppressedError(e, env.error, "An error was suppressed during disposal.") : e;
    env.hasError = true;
  }
  function next() {
    while (env.stack.length) {
      var rec = env.stack.pop();
      try {
        var result = rec.dispose && rec.dispose.call(rec.value);
        if (rec.async)
          return Promise.resolve(result).then(next, function(e) {
            fail(e);
            return next();
          });
      } catch (e) {
        fail(e);
      }
    }
    if (env.hasError)
      throw env.error;
  }
  return next();
}
const tslib_es6 = {
  __extends,
  __assign,
  __rest,
  __decorate,
  __param,
  __metadata,
  __awaiter,
  __generator,
  __createBinding,
  __exportStar,
  __values,
  __read,
  __spread,
  __spreadArrays,
  __spreadArray,
  __await,
  __asyncGenerator,
  __asyncDelegator,
  __asyncValues,
  __makeTemplateObject,
  __importStar,
  __importDefault,
  __classPrivateFieldGet,
  __classPrivateFieldSet,
  __classPrivateFieldIn,
  __addDisposableResource,
  __disposeResources
};
const tslib_es6$1 = /* @__PURE__ */ Object.freeze(/* @__PURE__ */ Object.defineProperty({
  __proto__: null,
  __addDisposableResource,
  get __assign() {
    return __assign;
  },
  __asyncDelegator,
  __asyncGenerator,
  __asyncValues,
  __await,
  __awaiter,
  __classPrivateFieldGet,
  __classPrivateFieldIn,
  __classPrivateFieldSet,
  __createBinding,
  __decorate,
  __disposeResources,
  __esDecorate,
  __exportStar,
  __extends,
  __generator,
  __importDefault,
  __importStar,
  __makeTemplateObject,
  __metadata,
  __param,
  __propKey,
  __read,
  __rest,
  __runInitializers,
  __setFunctionName,
  __spread,
  __spreadArray,
  __spreadArrays,
  __values,
  default: tslib_es6
}, Symbol.toStringTag, { value: "Module" }));
const require$$0 = /* @__PURE__ */ getAugmentedNamespace(tslib_es6$1);
var utils$1;
var hasRequiredUtils$1;
function requireUtils$1() {
  if (hasRequiredUtils$1)
    return utils$1;
  hasRequiredUtils$1 = 1;
  function parseContentType(str) {
    if (str.length === 0)
      return;
    const params = /* @__PURE__ */ Object.create(null);
    let i = 0;
    for (; i < str.length; ++i) {
      const code = str.charCodeAt(i);
      if (TOKEN[code] !== 1) {
        if (code !== 47 || i === 0)
          return;
        break;
      }
    }
    if (i === str.length)
      return;
    const type = str.slice(0, i).toLowerCase();
    const subtypeStart = ++i;
    for (; i < str.length; ++i) {
      const code = str.charCodeAt(i);
      if (TOKEN[code] !== 1) {
        if (i === subtypeStart)
          return;
        if (parseContentTypeParams(str, i, params) === void 0)
          return;
        break;
      }
    }
    if (i === subtypeStart)
      return;
    const subtype = str.slice(subtypeStart, i).toLowerCase();
    return { type, subtype, params };
  }
  function parseContentTypeParams(str, i, params) {
    while (i < str.length) {
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (code !== 32 && code !== 9)
          break;
      }
      if (i === str.length)
        break;
      if (str.charCodeAt(i++) !== 59)
        return;
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (code !== 32 && code !== 9)
          break;
      }
      if (i === str.length)
        return;
      let name;
      const nameStart = i;
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (TOKEN[code] !== 1) {
          if (code !== 61)
            return;
          break;
        }
      }
      if (i === str.length)
        return;
      name = str.slice(nameStart, i);
      ++i;
      if (i === str.length)
        return;
      let value = "";
      let valueStart;
      if (str.charCodeAt(i) === 34) {
        valueStart = ++i;
        let escaping = false;
        for (; i < str.length; ++i) {
          const code = str.charCodeAt(i);
          if (code === 92) {
            if (escaping) {
              valueStart = i;
              escaping = false;
            } else {
              value += str.slice(valueStart, i);
              escaping = true;
            }
            continue;
          }
          if (code === 34) {
            if (escaping) {
              valueStart = i;
              escaping = false;
              continue;
            }
            value += str.slice(valueStart, i);
            break;
          }
          if (escaping) {
            valueStart = i - 1;
            escaping = false;
          }
          if (QDTEXT[code] !== 1)
            return;
        }
        if (i === str.length)
          return;
        ++i;
      } else {
        valueStart = i;
        for (; i < str.length; ++i) {
          const code = str.charCodeAt(i);
          if (TOKEN[code] !== 1) {
            if (i === valueStart)
              return;
            break;
          }
        }
        value = str.slice(valueStart, i);
      }
      name = name.toLowerCase();
      if (params[name] === void 0)
        params[name] = value;
    }
    return params;
  }
  function parseDisposition(str, defDecoder) {
    if (str.length === 0)
      return;
    const params = /* @__PURE__ */ Object.create(null);
    let i = 0;
    for (; i < str.length; ++i) {
      const code = str.charCodeAt(i);
      if (TOKEN[code] !== 1) {
        if (parseDispositionParams(str, i, params, defDecoder) === void 0)
          return;
        break;
      }
    }
    const type = str.slice(0, i).toLowerCase();
    return { type, params };
  }
  function parseDispositionParams(str, i, params, defDecoder) {
    while (i < str.length) {
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (code !== 32 && code !== 9)
          break;
      }
      if (i === str.length)
        break;
      if (str.charCodeAt(i++) !== 59)
        return;
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (code !== 32 && code !== 9)
          break;
      }
      if (i === str.length)
        return;
      let name;
      const nameStart = i;
      for (; i < str.length; ++i) {
        const code = str.charCodeAt(i);
        if (TOKEN[code] !== 1) {
          if (code === 61)
            break;
          return;
        }
      }
      if (i === str.length)
        return;
      let value = "";
      let valueStart;
      let charset;
      name = str.slice(nameStart, i);
      if (name.charCodeAt(name.length - 1) === 42) {
        const charsetStart = ++i;
        for (; i < str.length; ++i) {
          const code = str.charCodeAt(i);
          if (CHARSET[code] !== 1) {
            if (code !== 39)
              return;
            break;
          }
        }
        if (i === str.length)
          return;
        charset = str.slice(charsetStart, i);
        ++i;
        for (; i < str.length; ++i) {
          const code = str.charCodeAt(i);
          if (code === 39)
            break;
        }
        if (i === str.length)
          return;
        ++i;
        if (i === str.length)
          return;
        valueStart = i;
        let encode = 0;
        for (; i < str.length; ++i) {
          const code = str.charCodeAt(i);
          if (EXTENDED_VALUE[code] !== 1) {
            if (code === 37) {
              let hexUpper;
              let hexLower;
              if (i + 2 < str.length && (hexUpper = HEX_VALUES[str.charCodeAt(i + 1)]) !== -1 && (hexLower = HEX_VALUES[str.charCodeAt(i + 2)]) !== -1) {
                const byteVal = (hexUpper << 4) + hexLower;
                value += str.slice(valueStart, i);
                value += String.fromCharCode(byteVal);
                i += 2;
                valueStart = i + 1;
                if (byteVal >= 128)
                  encode = 2;
                else if (encode === 0)
                  encode = 1;
                continue;
              }
              return;
            }
            break;
          }
        }
        value += str.slice(valueStart, i);
        value = convertToUTF8(value, charset, encode);
        if (value === void 0)
          return;
      } else {
        ++i;
        if (i === str.length)
          return;
        if (str.charCodeAt(i) === 34) {
          valueStart = ++i;
          let escaping = false;
          for (; i < str.length; ++i) {
            const code = str.charCodeAt(i);
            if (code === 92) {
              if (escaping) {
                valueStart = i;
                escaping = false;
              } else {
                value += str.slice(valueStart, i);
                escaping = true;
              }
              continue;
            }
            if (code === 34) {
              if (escaping) {
                valueStart = i;
                escaping = false;
                continue;
              }
              value += str.slice(valueStart, i);
              break;
            }
            if (escaping) {
              valueStart = i - 1;
              escaping = false;
            }
            if (QDTEXT[code] !== 1)
              return;
          }
          if (i === str.length)
            return;
          ++i;
        } else {
          valueStart = i;
          for (; i < str.length; ++i) {
            const code = str.charCodeAt(i);
            if (TOKEN[code] !== 1) {
              if (i === valueStart)
                return;
              break;
            }
          }
          value = str.slice(valueStart, i);
        }
        value = defDecoder(value, 2);
        if (value === void 0)
          return;
      }
      name = name.toLowerCase();
      if (params[name] === void 0)
        params[name] = value;
    }
    return params;
  }
  function getDecoder(charset) {
    let lc;
    while (true) {
      switch (charset) {
        case "utf-8":
        case "utf8":
          return decoders.utf8;
        case "latin1":
        case "ascii":
        case "us-ascii":
        case "iso-8859-1":
        case "iso8859-1":
        case "iso88591":
        case "iso_8859-1":
        case "windows-1252":
        case "iso_8859-1:1987":
        case "cp1252":
        case "x-cp1252":
          return decoders.latin1;
        case "utf16le":
        case "utf-16le":
        case "ucs2":
        case "ucs-2":
          return decoders.utf16le;
        case "base64":
          return decoders.base64;
        default:
          if (lc === void 0) {
            lc = true;
            charset = charset.toLowerCase();
            continue;
          }
          return decoders.other.bind(charset);
      }
    }
  }
  const decoders = {
    utf8: (data, hint) => {
      if (data.length === 0)
        return "";
      if (typeof data === "string") {
        if (hint < 2)
          return data;
        data = Buffer.from(data, "latin1");
      }
      return data.utf8Slice(0, data.length);
    },
    latin1: (data, hint) => {
      if (data.length === 0)
        return "";
      if (typeof data === "string")
        return data;
      return data.latin1Slice(0, data.length);
    },
    utf16le: (data, hint) => {
      if (data.length === 0)
        return "";
      if (typeof data === "string")
        data = Buffer.from(data, "latin1");
      return data.ucs2Slice(0, data.length);
    },
    base64: (data, hint) => {
      if (data.length === 0)
        return "";
      if (typeof data === "string")
        data = Buffer.from(data, "latin1");
      return data.base64Slice(0, data.length);
    },
    other: (data, hint) => {
      if (data.length === 0)
        return "";
      if (typeof data === "string")
        data = Buffer.from(data, "latin1");
      try {
        const decoder = new TextDecoder(this);
        return decoder.decode(data);
      } catch {
      }
    }
  };
  function convertToUTF8(data, charset, hint) {
    const decode = getDecoder(charset);
    if (decode)
      return decode(data, hint);
  }
  function basename(path) {
    if (typeof path !== "string")
      return "";
    for (let i = path.length - 1; i >= 0; --i) {
      switch (path.charCodeAt(i)) {
        case 47:
        case 92:
          path = path.slice(i + 1);
          return path === ".." || path === "." ? "" : path;
      }
    }
    return path === ".." || path === "." ? "" : path;
  }
  const TOKEN = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  const QDTEXT = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];
  const CHARSET = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  const EXTENDED_VALUE = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  const HEX_VALUES = [
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    10,
    11,
    12,
    13,
    14,
    15,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    10,
    11,
    12,
    13,
    14,
    15,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1
  ];
  utils$1 = {
    basename,
    convertToUTF8,
    getDecoder,
    parseContentType,
    parseDisposition
  };
  return utils$1;
}
var sbmh;
var hasRequiredSbmh;
function requireSbmh() {
  if (hasRequiredSbmh)
    return sbmh;
  hasRequiredSbmh = 1;
  function memcmp(buf1, pos1, buf2, pos2, num) {
    for (let i = 0; i < num; ++i) {
      if (buf1[pos1 + i] !== buf2[pos2 + i])
        return false;
    }
    return true;
  }
  class SBMH {
    constructor(needle, cb) {
      if (typeof cb !== "function")
        throw new Error("Missing match callback");
      if (typeof needle === "string")
        needle = Buffer.from(needle);
      else if (!Buffer.isBuffer(needle))
        throw new Error(`Expected Buffer for needle, got ${typeof needle}`);
      const needleLen = needle.length;
      this.maxMatches = Infinity;
      this.matches = 0;
      this._cb = cb;
      this._lookbehindSize = 0;
      this._needle = needle;
      this._bufPos = 0;
      this._lookbehind = Buffer.allocUnsafe(needleLen);
      this._occ = [
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen,
        needleLen
      ];
      if (needleLen > 1) {
        for (let i = 0; i < needleLen - 1; ++i)
          this._occ[needle[i]] = needleLen - 1 - i;
      }
    }
    reset() {
      this.matches = 0;
      this._lookbehindSize = 0;
      this._bufPos = 0;
    }
    push(chunk, pos) {
      let result;
      if (!Buffer.isBuffer(chunk))
        chunk = Buffer.from(chunk, "latin1");
      const chunkLen = chunk.length;
      this._bufPos = pos || 0;
      while (result !== chunkLen && this.matches < this.maxMatches)
        result = feed(this, chunk);
      return result;
    }
    destroy() {
      const lbSize = this._lookbehindSize;
      if (lbSize)
        this._cb(false, this._lookbehind, 0, lbSize, false);
      this.reset();
    }
  }
  function feed(self, data) {
    const len = data.length;
    const needle = self._needle;
    const needleLen = needle.length;
    let pos = -self._lookbehindSize;
    const lastNeedleCharPos = needleLen - 1;
    const lastNeedleChar = needle[lastNeedleCharPos];
    const end = len - needleLen;
    const occ = self._occ;
    const lookbehind = self._lookbehind;
    if (pos < 0) {
      while (pos < 0 && pos <= end) {
        const nextPos = pos + lastNeedleCharPos;
        const ch = nextPos < 0 ? lookbehind[self._lookbehindSize + nextPos] : data[nextPos];
        if (ch === lastNeedleChar && matchNeedle(self, data, pos, lastNeedleCharPos)) {
          self._lookbehindSize = 0;
          ++self.matches;
          if (pos > -self._lookbehindSize)
            self._cb(true, lookbehind, 0, self._lookbehindSize + pos, false);
          else
            self._cb(true, void 0, 0, 0, true);
          return self._bufPos = pos + needleLen;
        }
        pos += occ[ch];
      }
      while (pos < 0 && !matchNeedle(self, data, pos, len - pos))
        ++pos;
      if (pos < 0) {
        const bytesToCutOff = self._lookbehindSize + pos;
        if (bytesToCutOff > 0) {
          self._cb(false, lookbehind, 0, bytesToCutOff, false);
        }
        self._lookbehindSize -= bytesToCutOff;
        lookbehind.copy(lookbehind, 0, bytesToCutOff, self._lookbehindSize);
        lookbehind.set(data, self._lookbehindSize);
        self._lookbehindSize += len;
        self._bufPos = len;
        return len;
      }
      self._cb(false, lookbehind, 0, self._lookbehindSize, false);
      self._lookbehindSize = 0;
    }
    pos += self._bufPos;
    const firstNeedleChar = needle[0];
    while (pos <= end) {
      const ch = data[pos + lastNeedleCharPos];
      if (ch === lastNeedleChar && data[pos] === firstNeedleChar && memcmp(needle, 0, data, pos, lastNeedleCharPos)) {
        ++self.matches;
        if (pos > 0)
          self._cb(true, data, self._bufPos, pos, true);
        else
          self._cb(true, void 0, 0, 0, true);
        return self._bufPos = pos + needleLen;
      }
      pos += occ[ch];
    }
    while (pos < len) {
      if (data[pos] !== firstNeedleChar || !memcmp(data, pos, needle, 0, len - pos)) {
        ++pos;
        continue;
      }
      data.copy(lookbehind, 0, pos, len);
      self._lookbehindSize = len - pos;
      break;
    }
    if (pos > 0)
      self._cb(false, data, self._bufPos, pos < len ? pos : len, true);
    self._bufPos = len;
    return len;
  }
  function matchNeedle(self, data, pos, len) {
    const lb = self._lookbehind;
    const lbSize = self._lookbehindSize;
    const needle = self._needle;
    for (let i = 0; i < len; ++i, ++pos) {
      const ch = pos < 0 ? lb[lbSize + pos] : data[pos];
      if (ch !== needle[i])
        return false;
    }
    return true;
  }
  sbmh = SBMH;
  return sbmh;
}
var multipart$1;
var hasRequiredMultipart;
function requireMultipart() {
  if (hasRequiredMultipart)
    return multipart$1;
  hasRequiredMultipart = 1;
  const { Readable, Writable } = require$$0$1;
  const StreamSearch = requireSbmh();
  const {
    basename,
    convertToUTF8,
    getDecoder,
    parseContentType,
    parseDisposition
  } = requireUtils$1();
  const BUF_CRLF = Buffer.from("\r\n");
  const BUF_CR = Buffer.from("\r");
  const BUF_DASH = Buffer.from("-");
  function noop2() {
  }
  const MAX_HEADER_PAIRS = 2e3;
  const MAX_HEADER_SIZE = 16 * 1024;
  const HPARSER_NAME = 0;
  const HPARSER_PRE_OWS = 1;
  const HPARSER_VALUE = 2;
  class HeaderParser {
    constructor(cb) {
      this.header = /* @__PURE__ */ Object.create(null);
      this.pairCount = 0;
      this.byteCount = 0;
      this.state = HPARSER_NAME;
      this.name = "";
      this.value = "";
      this.crlf = 0;
      this.cb = cb;
    }
    reset() {
      this.header = /* @__PURE__ */ Object.create(null);
      this.pairCount = 0;
      this.byteCount = 0;
      this.state = HPARSER_NAME;
      this.name = "";
      this.value = "";
      this.crlf = 0;
    }
    push(chunk, pos, end) {
      let start = pos;
      while (pos < end) {
        switch (this.state) {
          case HPARSER_NAME: {
            let done = false;
            for (; pos < end; ++pos) {
              if (this.byteCount === MAX_HEADER_SIZE)
                return -1;
              ++this.byteCount;
              const code = chunk[pos];
              if (TOKEN[code] !== 1) {
                if (code !== 58)
                  return -1;
                this.name += chunk.latin1Slice(start, pos);
                if (this.name.length === 0)
                  return -1;
                ++pos;
                done = true;
                this.state = HPARSER_PRE_OWS;
                break;
              }
            }
            if (!done) {
              this.name += chunk.latin1Slice(start, pos);
              break;
            }
          }
          case HPARSER_PRE_OWS: {
            let done = false;
            for (; pos < end; ++pos) {
              if (this.byteCount === MAX_HEADER_SIZE)
                return -1;
              ++this.byteCount;
              const code = chunk[pos];
              if (code !== 32 && code !== 9) {
                start = pos;
                done = true;
                this.state = HPARSER_VALUE;
                break;
              }
            }
            if (!done)
              break;
          }
          case HPARSER_VALUE:
            switch (this.crlf) {
              case 0:
                for (; pos < end; ++pos) {
                  if (this.byteCount === MAX_HEADER_SIZE)
                    return -1;
                  ++this.byteCount;
                  const code = chunk[pos];
                  if (FIELD_VCHAR[code] !== 1) {
                    if (code !== 13)
                      return -1;
                    ++this.crlf;
                    break;
                  }
                }
                this.value += chunk.latin1Slice(start, pos++);
                break;
              case 1:
                if (this.byteCount === MAX_HEADER_SIZE)
                  return -1;
                ++this.byteCount;
                if (chunk[pos++] !== 10)
                  return -1;
                ++this.crlf;
                break;
              case 2: {
                if (this.byteCount === MAX_HEADER_SIZE)
                  return -1;
                ++this.byteCount;
                const code = chunk[pos];
                if (code === 32 || code === 9) {
                  start = pos;
                  this.crlf = 0;
                } else {
                  if (++this.pairCount < MAX_HEADER_PAIRS) {
                    this.name = this.name.toLowerCase();
                    if (this.header[this.name] === void 0)
                      this.header[this.name] = [this.value];
                    else
                      this.header[this.name].push(this.value);
                  }
                  if (code === 13) {
                    ++this.crlf;
                    ++pos;
                  } else {
                    start = pos;
                    this.crlf = 0;
                    this.state = HPARSER_NAME;
                    this.name = "";
                    this.value = "";
                  }
                }
                break;
              }
              case 3: {
                if (this.byteCount === MAX_HEADER_SIZE)
                  return -1;
                ++this.byteCount;
                if (chunk[pos++] !== 10)
                  return -1;
                const header = this.header;
                this.reset();
                this.cb(header);
                return pos;
              }
            }
            break;
        }
      }
      return pos;
    }
  }
  class FileStream extends Readable {
    constructor(opts, owner) {
      super(opts);
      this.truncated = false;
      this._readcb = null;
      this.once("end", () => {
        this._read();
        if (--owner._fileEndsLeft === 0 && owner._finalcb) {
          const cb = owner._finalcb;
          owner._finalcb = null;
          process.nextTick(cb);
        }
      });
    }
    _read(n) {
      const cb = this._readcb;
      if (cb) {
        this._readcb = null;
        cb();
      }
    }
  }
  const ignoreData = {
    push: (chunk, pos) => {
    },
    destroy: () => {
    }
  };
  function callAndUnsetCb(self, err) {
    const cb = self._writecb;
    self._writecb = null;
    if (err)
      self.destroy(err);
    else if (cb)
      cb();
  }
  function nullDecoder(val, hint) {
    return val;
  }
  class Multipart extends Writable {
    constructor(cfg) {
      const streamOpts = {
        autoDestroy: true,
        emitClose: true,
        highWaterMark: typeof cfg.highWaterMark === "number" ? cfg.highWaterMark : void 0
      };
      super(streamOpts);
      if (!cfg.conType.params || typeof cfg.conType.params.boundary !== "string")
        throw new Error("Multipart: Boundary not found");
      const boundary = cfg.conType.params.boundary;
      const paramDecoder = typeof cfg.defParamCharset === "string" && cfg.defParamCharset ? getDecoder(cfg.defParamCharset) : nullDecoder;
      const defCharset = cfg.defCharset || "utf8";
      const preservePath = cfg.preservePath;
      const fileOpts = {
        autoDestroy: true,
        emitClose: true,
        highWaterMark: typeof cfg.fileHwm === "number" ? cfg.fileHwm : void 0
      };
      const limits = cfg.limits;
      const fieldSizeLimit = limits && typeof limits.fieldSize === "number" ? limits.fieldSize : 1 * 1024 * 1024;
      const fileSizeLimit = limits && typeof limits.fileSize === "number" ? limits.fileSize : Infinity;
      const filesLimit = limits && typeof limits.files === "number" ? limits.files : Infinity;
      const fieldsLimit = limits && typeof limits.fields === "number" ? limits.fields : Infinity;
      const partsLimit = limits && typeof limits.parts === "number" ? limits.parts : Infinity;
      let parts = -1;
      let fields = 0;
      let files = 0;
      let skipPart = false;
      this._fileEndsLeft = 0;
      this._fileStream = void 0;
      this._complete = false;
      let fileSize = 0;
      let field;
      let fieldSize = 0;
      let partCharset;
      let partEncoding;
      let partType;
      let partName;
      let partTruncated = false;
      let hitFilesLimit = false;
      let hitFieldsLimit = false;
      this._hparser = null;
      const hparser = new HeaderParser((header) => {
        this._hparser = null;
        skipPart = false;
        partType = "text/plain";
        partCharset = defCharset;
        partEncoding = "7bit";
        partName = void 0;
        partTruncated = false;
        let filename;
        if (!header["content-disposition"]) {
          skipPart = true;
          return;
        }
        const disp = parseDisposition(
          header["content-disposition"][0],
          paramDecoder
        );
        if (!disp || disp.type !== "form-data") {
          skipPart = true;
          return;
        }
        if (disp.params) {
          if (disp.params.name)
            partName = disp.params.name;
          if (disp.params["filename*"])
            filename = disp.params["filename*"];
          else if (disp.params.filename)
            filename = disp.params.filename;
          if (filename !== void 0 && !preservePath)
            filename = basename(filename);
        }
        if (header["content-type"]) {
          const conType = parseContentType(header["content-type"][0]);
          if (conType) {
            partType = `${conType.type}/${conType.subtype}`;
            if (conType.params && typeof conType.params.charset === "string")
              partCharset = conType.params.charset.toLowerCase();
          }
        }
        if (header["content-transfer-encoding"])
          partEncoding = header["content-transfer-encoding"][0].toLowerCase();
        if (partType === "application/octet-stream" || filename !== void 0) {
          if (files === filesLimit) {
            if (!hitFilesLimit) {
              hitFilesLimit = true;
              this.emit("filesLimit");
            }
            skipPart = true;
            return;
          }
          ++files;
          if (this.listenerCount("file") === 0) {
            skipPart = true;
            return;
          }
          fileSize = 0;
          this._fileStream = new FileStream(fileOpts, this);
          ++this._fileEndsLeft;
          this.emit(
            "file",
            partName,
            this._fileStream,
            {
              filename,
              encoding: partEncoding,
              mimeType: partType
            }
          );
        } else {
          if (fields === fieldsLimit) {
            if (!hitFieldsLimit) {
              hitFieldsLimit = true;
              this.emit("fieldsLimit");
            }
            skipPart = true;
            return;
          }
          ++fields;
          if (this.listenerCount("field") === 0) {
            skipPart = true;
            return;
          }
          field = [];
          fieldSize = 0;
        }
      });
      let matchPostBoundary = 0;
      const ssCb = (isMatch, data, start, end, isDataSafe) => {
        retrydata:
          while (data) {
            if (this._hparser !== null) {
              const ret = this._hparser.push(data, start, end);
              if (ret === -1) {
                this._hparser = null;
                hparser.reset();
                this.emit("error", new Error("Malformed part header"));
                break;
              }
              start = ret;
            }
            if (start === end)
              break;
            if (matchPostBoundary !== 0) {
              if (matchPostBoundary === 1) {
                switch (data[start]) {
                  case 45:
                    matchPostBoundary = 2;
                    ++start;
                    break;
                  case 13:
                    matchPostBoundary = 3;
                    ++start;
                    break;
                  default:
                    matchPostBoundary = 0;
                }
                if (start === end)
                  return;
              }
              if (matchPostBoundary === 2) {
                matchPostBoundary = 0;
                if (data[start] === 45) {
                  this._complete = true;
                  this._bparser = ignoreData;
                  return;
                }
                const writecb = this._writecb;
                this._writecb = noop2;
                ssCb(false, BUF_DASH, 0, 1, false);
                this._writecb = writecb;
              } else if (matchPostBoundary === 3) {
                matchPostBoundary = 0;
                if (data[start] === 10) {
                  ++start;
                  if (parts >= partsLimit)
                    break;
                  this._hparser = hparser;
                  if (start === end)
                    break;
                  continue retrydata;
                } else {
                  const writecb = this._writecb;
                  this._writecb = noop2;
                  ssCb(false, BUF_CR, 0, 1, false);
                  this._writecb = writecb;
                }
              }
            }
            if (!skipPart) {
              if (this._fileStream) {
                let chunk;
                const actualLen = Math.min(end - start, fileSizeLimit - fileSize);
                if (!isDataSafe) {
                  chunk = Buffer.allocUnsafe(actualLen);
                  data.copy(chunk, 0, start, start + actualLen);
                } else {
                  chunk = data.slice(start, start + actualLen);
                }
                fileSize += chunk.length;
                if (fileSize === fileSizeLimit) {
                  if (chunk.length > 0)
                    this._fileStream.push(chunk);
                  this._fileStream.emit("limit");
                  this._fileStream.truncated = true;
                  skipPart = true;
                } else if (!this._fileStream.push(chunk)) {
                  if (this._writecb)
                    this._fileStream._readcb = this._writecb;
                  this._writecb = null;
                }
              } else if (field !== void 0) {
                let chunk;
                const actualLen = Math.min(
                  end - start,
                  fieldSizeLimit - fieldSize
                );
                if (!isDataSafe) {
                  chunk = Buffer.allocUnsafe(actualLen);
                  data.copy(chunk, 0, start, start + actualLen);
                } else {
                  chunk = data.slice(start, start + actualLen);
                }
                fieldSize += actualLen;
                field.push(chunk);
                if (fieldSize === fieldSizeLimit) {
                  skipPart = true;
                  partTruncated = true;
                }
              }
            }
            break;
          }
        if (isMatch) {
          matchPostBoundary = 1;
          if (this._fileStream) {
            this._fileStream.push(null);
            this._fileStream = null;
          } else if (field !== void 0) {
            let data2;
            switch (field.length) {
              case 0:
                data2 = "";
                break;
              case 1:
                data2 = convertToUTF8(field[0], partCharset, 0);
                break;
              default:
                data2 = convertToUTF8(
                  Buffer.concat(field, fieldSize),
                  partCharset,
                  0
                );
            }
            field = void 0;
            fieldSize = 0;
            this.emit(
              "field",
              partName,
              data2,
              {
                nameTruncated: false,
                valueTruncated: partTruncated,
                encoding: partEncoding,
                mimeType: partType
              }
            );
          }
          if (++parts === partsLimit)
            this.emit("partsLimit");
        }
      };
      this._bparser = new StreamSearch(`\r
--${boundary}`, ssCb);
      this._writecb = null;
      this._finalcb = null;
      this.write(BUF_CRLF);
    }
    static detect(conType) {
      return conType.type === "multipart" && conType.subtype === "form-data";
    }
    _write(chunk, enc, cb) {
      this._writecb = cb;
      this._bparser.push(chunk, 0);
      if (this._writecb)
        callAndUnsetCb(this);
    }
    _destroy(err, cb) {
      this._hparser = null;
      this._bparser = ignoreData;
      if (!err)
        err = checkEndState(this);
      const fileStream = this._fileStream;
      if (fileStream) {
        this._fileStream = null;
        fileStream.destroy(err);
      }
      cb(err);
    }
    _final(cb) {
      this._bparser.destroy();
      if (!this._complete)
        return cb(new Error("Unexpected end of form"));
      if (this._fileEndsLeft)
        this._finalcb = finalcb.bind(null, this, cb);
      else
        finalcb(this, cb);
    }
  }
  function finalcb(self, cb, err) {
    if (err)
      return cb(err);
    err = checkEndState(self);
    cb(err);
  }
  function checkEndState(self) {
    if (self._hparser)
      return new Error("Malformed part header");
    const fileStream = self._fileStream;
    if (fileStream) {
      self._fileStream = null;
      fileStream.destroy(new Error("Unexpected end of file"));
    }
    if (!self._complete)
      return new Error("Unexpected end of form");
  }
  const TOKEN = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  const FIELD_VCHAR = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];
  multipart$1 = Multipart;
  return multipart$1;
}
var urlencoded;
var hasRequiredUrlencoded;
function requireUrlencoded() {
  if (hasRequiredUrlencoded)
    return urlencoded;
  hasRequiredUrlencoded = 1;
  const { Writable } = require$$0$1;
  const { getDecoder } = requireUtils$1();
  class URLEncoded extends Writable {
    constructor(cfg) {
      const streamOpts = {
        autoDestroy: true,
        emitClose: true,
        highWaterMark: typeof cfg.highWaterMark === "number" ? cfg.highWaterMark : void 0
      };
      super(streamOpts);
      let charset = cfg.defCharset || "utf8";
      if (cfg.conType.params && typeof cfg.conType.params.charset === "string")
        charset = cfg.conType.params.charset;
      this.charset = charset;
      const limits = cfg.limits;
      this.fieldSizeLimit = limits && typeof limits.fieldSize === "number" ? limits.fieldSize : 1 * 1024 * 1024;
      this.fieldsLimit = limits && typeof limits.fields === "number" ? limits.fields : Infinity;
      this.fieldNameSizeLimit = limits && typeof limits.fieldNameSize === "number" ? limits.fieldNameSize : 100;
      this._inKey = true;
      this._keyTrunc = false;
      this._valTrunc = false;
      this._bytesKey = 0;
      this._bytesVal = 0;
      this._fields = 0;
      this._key = "";
      this._val = "";
      this._byte = -2;
      this._lastPos = 0;
      this._encode = 0;
      this._decoder = getDecoder(charset);
    }
    static detect(conType) {
      return conType.type === "application" && conType.subtype === "x-www-form-urlencoded";
    }
    _write(chunk, enc, cb) {
      if (this._fields >= this.fieldsLimit)
        return cb();
      let i = 0;
      const len = chunk.length;
      this._lastPos = 0;
      if (this._byte !== -2) {
        i = readPctEnc(this, chunk, i, len);
        if (i === -1)
          return cb(new Error("Malformed urlencoded form"));
        if (i >= len)
          return cb();
        if (this._inKey)
          ++this._bytesKey;
        else
          ++this._bytesVal;
      }
      main:
        while (i < len) {
          if (this._inKey) {
            i = skipKeyBytes(this, chunk, i, len);
            while (i < len) {
              switch (chunk[i]) {
                case 61:
                  if (this._lastPos < i)
                    this._key += chunk.latin1Slice(this._lastPos, i);
                  this._lastPos = ++i;
                  this._key = this._decoder(this._key, this._encode);
                  this._encode = 0;
                  this._inKey = false;
                  continue main;
                case 38:
                  if (this._lastPos < i)
                    this._key += chunk.latin1Slice(this._lastPos, i);
                  this._lastPos = ++i;
                  this._key = this._decoder(this._key, this._encode);
                  this._encode = 0;
                  if (this._bytesKey > 0) {
                    this.emit(
                      "field",
                      this._key,
                      "",
                      {
                        nameTruncated: this._keyTrunc,
                        valueTruncated: false,
                        encoding: this.charset,
                        mimeType: "text/plain"
                      }
                    );
                  }
                  this._key = "";
                  this._val = "";
                  this._keyTrunc = false;
                  this._valTrunc = false;
                  this._bytesKey = 0;
                  this._bytesVal = 0;
                  if (++this._fields >= this.fieldsLimit) {
                    this.emit("fieldsLimit");
                    return cb();
                  }
                  continue;
                case 43:
                  if (this._lastPos < i)
                    this._key += chunk.latin1Slice(this._lastPos, i);
                  this._key += " ";
                  this._lastPos = i + 1;
                  break;
                case 37:
                  if (this._encode === 0)
                    this._encode = 1;
                  if (this._lastPos < i)
                    this._key += chunk.latin1Slice(this._lastPos, i);
                  this._lastPos = i + 1;
                  this._byte = -1;
                  i = readPctEnc(this, chunk, i + 1, len);
                  if (i === -1)
                    return cb(new Error("Malformed urlencoded form"));
                  if (i >= len)
                    return cb();
                  ++this._bytesKey;
                  i = skipKeyBytes(this, chunk, i, len);
                  continue;
              }
              ++i;
              ++this._bytesKey;
              i = skipKeyBytes(this, chunk, i, len);
            }
            if (this._lastPos < i)
              this._key += chunk.latin1Slice(this._lastPos, i);
          } else {
            i = skipValBytes(this, chunk, i, len);
            while (i < len) {
              switch (chunk[i]) {
                case 38:
                  if (this._lastPos < i)
                    this._val += chunk.latin1Slice(this._lastPos, i);
                  this._lastPos = ++i;
                  this._inKey = true;
                  this._val = this._decoder(this._val, this._encode);
                  this._encode = 0;
                  if (this._bytesKey > 0 || this._bytesVal > 0) {
                    this.emit(
                      "field",
                      this._key,
                      this._val,
                      {
                        nameTruncated: this._keyTrunc,
                        valueTruncated: this._valTrunc,
                        encoding: this.charset,
                        mimeType: "text/plain"
                      }
                    );
                  }
                  this._key = "";
                  this._val = "";
                  this._keyTrunc = false;
                  this._valTrunc = false;
                  this._bytesKey = 0;
                  this._bytesVal = 0;
                  if (++this._fields >= this.fieldsLimit) {
                    this.emit("fieldsLimit");
                    return cb();
                  }
                  continue main;
                case 43:
                  if (this._lastPos < i)
                    this._val += chunk.latin1Slice(this._lastPos, i);
                  this._val += " ";
                  this._lastPos = i + 1;
                  break;
                case 37:
                  if (this._encode === 0)
                    this._encode = 1;
                  if (this._lastPos < i)
                    this._val += chunk.latin1Slice(this._lastPos, i);
                  this._lastPos = i + 1;
                  this._byte = -1;
                  i = readPctEnc(this, chunk, i + 1, len);
                  if (i === -1)
                    return cb(new Error("Malformed urlencoded form"));
                  if (i >= len)
                    return cb();
                  ++this._bytesVal;
                  i = skipValBytes(this, chunk, i, len);
                  continue;
              }
              ++i;
              ++this._bytesVal;
              i = skipValBytes(this, chunk, i, len);
            }
            if (this._lastPos < i)
              this._val += chunk.latin1Slice(this._lastPos, i);
          }
        }
      cb();
    }
    _final(cb) {
      if (this._byte !== -2)
        return cb(new Error("Malformed urlencoded form"));
      if (!this._inKey || this._bytesKey > 0 || this._bytesVal > 0) {
        if (this._inKey)
          this._key = this._decoder(this._key, this._encode);
        else
          this._val = this._decoder(this._val, this._encode);
        this.emit(
          "field",
          this._key,
          this._val,
          {
            nameTruncated: this._keyTrunc,
            valueTruncated: this._valTrunc,
            encoding: this.charset,
            mimeType: "text/plain"
          }
        );
      }
      cb();
    }
  }
  function readPctEnc(self, chunk, pos, len) {
    if (pos >= len)
      return len;
    if (self._byte === -1) {
      const hexUpper = HEX_VALUES[chunk[pos++]];
      if (hexUpper === -1)
        return -1;
      if (hexUpper >= 8)
        self._encode = 2;
      if (pos < len) {
        const hexLower = HEX_VALUES[chunk[pos++]];
        if (hexLower === -1)
          return -1;
        if (self._inKey)
          self._key += String.fromCharCode((hexUpper << 4) + hexLower);
        else
          self._val += String.fromCharCode((hexUpper << 4) + hexLower);
        self._byte = -2;
        self._lastPos = pos;
      } else {
        self._byte = hexUpper;
      }
    } else {
      const hexLower = HEX_VALUES[chunk[pos++]];
      if (hexLower === -1)
        return -1;
      if (self._inKey)
        self._key += String.fromCharCode((self._byte << 4) + hexLower);
      else
        self._val += String.fromCharCode((self._byte << 4) + hexLower);
      self._byte = -2;
      self._lastPos = pos;
    }
    return pos;
  }
  function skipKeyBytes(self, chunk, pos, len) {
    if (self._bytesKey > self.fieldNameSizeLimit) {
      if (!self._keyTrunc) {
        if (self._lastPos < pos)
          self._key += chunk.latin1Slice(self._lastPos, pos - 1);
      }
      self._keyTrunc = true;
      for (; pos < len; ++pos) {
        const code = chunk[pos];
        if (code === 61 || code === 38)
          break;
        ++self._bytesKey;
      }
      self._lastPos = pos;
    }
    return pos;
  }
  function skipValBytes(self, chunk, pos, len) {
    if (self._bytesVal > self.fieldSizeLimit) {
      if (!self._valTrunc) {
        if (self._lastPos < pos)
          self._val += chunk.latin1Slice(self._lastPos, pos - 1);
      }
      self._valTrunc = true;
      for (; pos < len; ++pos) {
        if (chunk[pos] === 38)
          break;
        ++self._bytesVal;
      }
      self._lastPos = pos;
    }
    return pos;
  }
  const HEX_VALUES = [
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    10,
    11,
    12,
    13,
    14,
    15,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    10,
    11,
    12,
    13,
    14,
    15,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1
  ];
  urlencoded = URLEncoded;
  return urlencoded;
}
var lib$1;
var hasRequiredLib$1;
function requireLib$1() {
  if (hasRequiredLib$1)
    return lib$1;
  hasRequiredLib$1 = 1;
  const { parseContentType } = requireUtils$1();
  function getInstance(cfg) {
    const headers = cfg.headers;
    const conType = parseContentType(headers["content-type"]);
    if (!conType)
      throw new Error("Malformed content type");
    for (const type of TYPES) {
      const matched = type.detect(conType);
      if (!matched)
        continue;
      const instanceCfg = {
        limits: cfg.limits,
        headers,
        conType,
        highWaterMark: void 0,
        fileHwm: void 0,
        defCharset: void 0,
        defParamCharset: void 0,
        preservePath: false
      };
      if (cfg.highWaterMark)
        instanceCfg.highWaterMark = cfg.highWaterMark;
      if (cfg.fileHwm)
        instanceCfg.fileHwm = cfg.fileHwm;
      instanceCfg.defCharset = cfg.defCharset;
      instanceCfg.defParamCharset = cfg.defParamCharset;
      instanceCfg.preservePath = cfg.preservePath;
      return new type(instanceCfg);
    }
    throw new Error(`Unsupported content type: ${headers["content-type"]}`);
  }
  const TYPES = [
    requireMultipart(),
    requireUrlencoded()
  ].filter(function(typemod) {
    return typeof typemod.detect === "function";
  });
  lib$1 = (cfg) => {
    if (typeof cfg !== "object" || cfg === null)
      cfg = {};
    if (typeof cfg.headers !== "object" || cfg.headers === null || typeof cfg.headers["content-type"] !== "string") {
      throw new Error("Missing Content-Type");
    }
    return getInstance(cfg);
  };
  return lib$1;
}
var Blob$1 = {};
var ReadableStream$2 = {};
var hasRequiredReadableStream;
function requireReadableStream() {
  if (hasRequiredReadableStream)
    return ReadableStream$2;
  hasRequiredReadableStream = 1;
  Object.defineProperty(ReadableStream$2, "__esModule", { value: true });
  ReadableStream$2.PonyfillReadableStream = void 0;
  const stream_1 = require$$0$1;
  function createController(desiredSize, readable) {
    let chunks = [];
    let _closed = false;
    let flushed = false;
    return {
      desiredSize,
      enqueue(chunk) {
        const buf = typeof chunk === "string" ? Buffer.from(chunk) : chunk;
        if (!flushed) {
          chunks.push(buf);
        } else {
          readable.push(buf);
        }
      },
      close() {
        if (chunks.length > 0) {
          this._flush();
        }
        readable.push(null);
        _closed = true;
      },
      error(error) {
        if (chunks.length > 0) {
          this._flush();
        }
        readable.destroy(error);
      },
      get _closed() {
        return _closed;
      },
      _flush() {
        flushed = true;
        if (chunks.length > 0) {
          const concatenated = chunks.length > 1 ? Buffer.concat(chunks) : chunks[0];
          readable.push(concatenated);
          chunks = [];
        }
      }
    };
  }
  function isNodeReadable(obj) {
    return (obj == null ? void 0 : obj.read) != null;
  }
  function isReadableStream(obj) {
    return (obj == null ? void 0 : obj.getReader) != null;
  }
  class PonyfillReadableStream {
    constructor(underlyingSource) {
      this.locked = false;
      if (underlyingSource instanceof PonyfillReadableStream && underlyingSource.readable != null) {
        this.readable = underlyingSource.readable;
      } else if (isNodeReadable(underlyingSource)) {
        this.readable = underlyingSource;
      } else if (isReadableStream(underlyingSource)) {
        let reader;
        let started = false;
        this.readable = new stream_1.Readable({
          read() {
            if (!started) {
              started = true;
              reader = underlyingSource.getReader();
            }
            reader.read().then(({ value, done }) => {
              if (done) {
                this.push(null);
              } else {
                this.push(value);
              }
            }).catch((err) => {
              this.destroy(err);
            });
          },
          destroy(err, callback) {
            reader.cancel(err).then(() => callback(err), callback);
          }
        });
      } else {
        let started = false;
        let ongoing = false;
        this.readable = new stream_1.Readable({
          read(desiredSize) {
            if (ongoing) {
              return;
            }
            ongoing = true;
            return Promise.resolve().then(async () => {
              var _a, _b2;
              if (!started) {
                const controller2 = createController(desiredSize, this);
                started = true;
                await ((_a = underlyingSource == null ? void 0 : underlyingSource.start) == null ? void 0 : _a.call(underlyingSource, controller2));
                controller2._flush();
                if (controller2._closed) {
                  return;
                }
              }
              const controller = createController(desiredSize, this);
              await ((_b2 = underlyingSource == null ? void 0 : underlyingSource.pull) == null ? void 0 : _b2.call(underlyingSource, controller));
              controller._flush();
              ongoing = false;
            });
          },
          async destroy(err, callback) {
            var _a;
            try {
              await ((_a = underlyingSource == null ? void 0 : underlyingSource.cancel) == null ? void 0 : _a.call(underlyingSource, err));
              callback(null);
            } catch (err2) {
              callback(err2);
            }
          }
        });
      }
    }
    cancel(reason) {
      this.readable.destroy(reason);
      return Promise.resolve();
    }
    getReader(_options) {
      const iterator = this.readable[Symbol.asyncIterator]();
      this.locked = true;
      return {
        read() {
          return iterator.next();
        },
        releaseLock: () => {
          var _a;
          (_a = iterator.return) == null ? void 0 : _a.call(iterator);
          this.locked = false;
        },
        cancel: async (reason) => {
          var _a;
          await ((_a = iterator.return) == null ? void 0 : _a.call(iterator, reason));
          this.locked = false;
        },
        closed: new Promise((resolve, reject) => {
          this.readable.once("end", resolve);
          this.readable.once("error", reject);
        })
      };
    }
    [Symbol.asyncIterator]() {
      return this.readable[Symbol.asyncIterator]();
    }
    tee() {
      throw new Error("Not implemented");
    }
    async pipeTo(destination) {
      const writer = destination.getWriter();
      await writer.ready;
      for await (const chunk of this.readable) {
        await writer.write(chunk);
      }
      await writer.ready;
      return writer.close();
    }
    pipeThrough({ writable, readable }) {
      this.pipeTo(writable);
      return readable;
    }
    static [Symbol.hasInstance](instance) {
      return isReadableStream(instance);
    }
  }
  ReadableStream$2.PonyfillReadableStream = PonyfillReadableStream;
  return ReadableStream$2;
}
var utils = {};
var hasRequiredUtils;
function requireUtils() {
  if (hasRequiredUtils)
    return utils;
  hasRequiredUtils = 1;
  Object.defineProperty(utils, "__esModule", { value: true });
  utils.isNodeReadable = utils.isArrayBufferView = utils.fakePromise = utils.defaultHeadersSerializer = utils.getHeadersObj = void 0;
  function isHeadersInstance(obj) {
    return (obj == null ? void 0 : obj.forEach) != null;
  }
  function getHeadersObj(headers) {
    if (headers == null || !isHeadersInstance(headers)) {
      return headers;
    }
    const obj = {};
    headers.forEach((value, key) => {
      obj[key] = value;
    });
    return obj;
  }
  utils.getHeadersObj = getHeadersObj;
  function defaultHeadersSerializer(headers, onContentLength) {
    const headerArray = [];
    headers.forEach((value, key) => {
      if (onContentLength && key === "content-length") {
        onContentLength(value);
      }
      headerArray.push(`${key}: ${value}`);
    });
    return headerArray;
  }
  utils.defaultHeadersSerializer = defaultHeadersSerializer;
  function isPromise2(val) {
    return (val == null ? void 0 : val.then) != null;
  }
  function fakePromise(value) {
    if (isPromise2(value)) {
      return value;
    }
    return {
      then(resolve) {
        if (resolve) {
          const callbackResult = resolve(value);
          if (isPromise2(callbackResult)) {
            return callbackResult;
          }
          return fakePromise(callbackResult);
        }
        return this;
      },
      catch() {
        return this;
      },
      finally(cb) {
        if (cb) {
          const callbackResult = cb();
          if (isPromise2(callbackResult)) {
            return callbackResult.then(() => value);
          }
          return fakePromise(value);
        }
        return this;
      },
      [Symbol.toStringTag]: "Promise"
    };
  }
  utils.fakePromise = fakePromise;
  function isArrayBufferView(obj) {
    return obj != null && obj.buffer != null && obj.byteLength != null && obj.byteOffset != null;
  }
  utils.isArrayBufferView = isArrayBufferView;
  function isNodeReadable(obj) {
    return obj != null && obj.pipe != null;
  }
  utils.isNodeReadable = isNodeReadable;
  return utils;
}
var hasRequiredBlob;
function requireBlob() {
  if (hasRequiredBlob)
    return Blob$1;
  hasRequiredBlob = 1;
  Object.defineProperty(Blob$1, "__esModule", { value: true });
  Blob$1.PonyfillBlob = void 0;
  const ReadableStream_js_1 = requireReadableStream();
  const utils_js_1 = requireUtils();
  function getBlobPartAsBuffer(blobPart) {
    if (typeof blobPart === "string") {
      return Buffer.from(blobPart);
    } else if (Buffer.isBuffer(blobPart)) {
      return blobPart;
    } else if ((0, utils_js_1.isArrayBufferView)(blobPart)) {
      return Buffer.from(blobPart.buffer, blobPart.byteOffset, blobPart.byteLength);
    } else {
      return Buffer.from(blobPart);
    }
  }
  function isBlob(obj) {
    return obj != null && obj.arrayBuffer != null;
  }
  class PonyfillBlob {
    constructor(blobParts, options) {
      this.blobParts = blobParts;
      this._size = null;
      this.type = (options == null ? void 0 : options.type) || "application/octet-stream";
      this.encoding = (options == null ? void 0 : options.encoding) || "utf8";
      this._size = (options == null ? void 0 : options.size) || null;
      if (blobParts.length === 1 && isBlob(blobParts[0])) {
        return blobParts[0];
      }
    }
    arrayBuffer() {
      if (this.blobParts.length === 1) {
        const blobPart = this.blobParts[0];
        if (isBlob(blobPart)) {
          return blobPart.arrayBuffer();
        }
        return (0, utils_js_1.fakePromise)(getBlobPartAsBuffer(blobPart));
      }
      const jobs = [];
      const bufferChunks = this.blobParts.map((blobPart, i) => {
        if (isBlob(blobPart)) {
          jobs.push(blobPart.arrayBuffer().then((arrayBuf) => {
            bufferChunks[i] = Buffer.from(arrayBuf, void 0, blobPart.size);
          }));
          return void 0;
        } else {
          return getBlobPartAsBuffer(blobPart);
        }
      });
      if (jobs.length > 0) {
        return Promise.all(jobs).then(() => Buffer.concat(bufferChunks, this._size || void 0));
      }
      return (0, utils_js_1.fakePromise)(Buffer.concat(bufferChunks, this._size || void 0));
    }
    text() {
      if (this.blobParts.length === 1) {
        const blobPart = this.blobParts[0];
        if (typeof blobPart === "string") {
          return (0, utils_js_1.fakePromise)(blobPart);
        }
        if (isBlob(blobPart)) {
          return blobPart.text();
        }
        const buf = getBlobPartAsBuffer(blobPart);
        return (0, utils_js_1.fakePromise)(buf.toString(this.encoding));
      }
      return this.arrayBuffer().then((buf) => buf.toString(this.encoding));
    }
    get size() {
      if (this._size == null) {
        this._size = 0;
        for (const blobPart of this.blobParts) {
          if (typeof blobPart === "string") {
            this._size += Buffer.byteLength(blobPart);
          } else if (isBlob(blobPart)) {
            this._size += blobPart.size;
          } else if ((0, utils_js_1.isArrayBufferView)(blobPart)) {
            this._size += blobPart.byteLength;
          }
        }
      }
      return this._size;
    }
    stream() {
      if (this.blobParts.length === 1) {
        const blobPart = this.blobParts[0];
        if (isBlob(blobPart)) {
          return blobPart.stream();
        }
        const buf = getBlobPartAsBuffer(blobPart);
        return new ReadableStream_js_1.PonyfillReadableStream({
          start: (controller) => {
            controller.enqueue(buf);
            controller.close();
          }
        });
      }
      let blobPartIterator;
      return new ReadableStream_js_1.PonyfillReadableStream({
        start: (controller) => {
          if (this.blobParts.length === 0) {
            controller.close();
            return;
          }
          blobPartIterator = this.blobParts[Symbol.iterator]();
        },
        pull: (controller) => {
          const { value: blobPart, done } = blobPartIterator.next();
          if (done) {
            controller.close();
            return;
          }
          if (blobPart) {
            if (isBlob(blobPart)) {
              return blobPart.arrayBuffer().then((arrayBuffer) => {
                const buf2 = Buffer.from(arrayBuffer, void 0, blobPart.size);
                controller.enqueue(buf2);
              });
            }
            const buf = getBlobPartAsBuffer(blobPart);
            controller.enqueue(buf);
          }
        }
      });
    }
    slice() {
      throw new Error("Not implemented");
    }
  }
  Blob$1.PonyfillBlob = PonyfillBlob;
  return Blob$1;
}
var File$1 = {};
var hasRequiredFile;
function requireFile() {
  if (hasRequiredFile)
    return File$1;
  hasRequiredFile = 1;
  Object.defineProperty(File$1, "__esModule", { value: true });
  File$1.PonyfillFile = void 0;
  const Blob_js_1 = requireBlob();
  class PonyfillFile extends Blob_js_1.PonyfillBlob {
    constructor(fileBits, name, options) {
      super(fileBits, options);
      this.name = name;
      this.webkitRelativePath = "";
      this.lastModified = (options == null ? void 0 : options.lastModified) || Date.now();
    }
  }
  File$1.PonyfillFile = PonyfillFile;
  return File$1;
}
var FormData$1 = {};
var hasRequiredFormData;
function requireFormData() {
  if (hasRequiredFormData)
    return FormData$1;
  hasRequiredFormData = 1;
  Object.defineProperty(FormData$1, "__esModule", { value: true });
  FormData$1.getStreamFromFormData = FormData$1.PonyfillFormData = void 0;
  const ReadableStream_js_1 = requireReadableStream();
  class PonyfillFormData {
    constructor() {
      this.map = /* @__PURE__ */ new Map();
    }
    append(name, value, fileName) {
      let values = this.map.get(name);
      if (!values) {
        values = [];
        this.map.set(name, values);
      }
      const entry = isBlob(value) ? getNormalizedFile(name, value, fileName) : value;
      values.push(entry);
    }
    delete(name) {
      this.map.delete(name);
    }
    get(name) {
      const values = this.map.get(name);
      return values ? values[0] : null;
    }
    getAll(name) {
      return this.map.get(name) || [];
    }
    has(name) {
      return this.map.has(name);
    }
    set(name, value, fileName) {
      const entry = isBlob(value) ? getNormalizedFile(name, value, fileName) : value;
      this.map.set(name, [entry]);
    }
    *[Symbol.iterator]() {
      for (const [key, values] of this.map) {
        for (const value of values) {
          yield [key, value];
        }
      }
    }
    entries() {
      return this[Symbol.iterator]();
    }
    keys() {
      return this.map.keys();
    }
    *values() {
      for (const values of this.map.values()) {
        for (const value of values) {
          yield value;
        }
      }
    }
    forEach(callback) {
      for (const [key, value] of this) {
        callback(value, key, this);
      }
    }
  }
  FormData$1.PonyfillFormData = PonyfillFormData;
  function getStreamFromFormData(formData, boundary = "---") {
    const entries = [];
    let sentInitialHeader = false;
    return new ReadableStream_js_1.PonyfillReadableStream({
      start: (controller) => {
        formData.forEach((value, key) => {
          if (!sentInitialHeader) {
            controller.enqueue(Buffer.from(`--${boundary}\r
`));
            sentInitialHeader = true;
          }
          entries.push([key, value]);
        });
        if (!sentInitialHeader) {
          controller.enqueue(Buffer.from(`--${boundary}--\r
`));
          controller.close();
        }
      },
      pull: async (controller) => {
        const entry = entries.shift();
        if (entry) {
          const [key, value] = entry;
          if (typeof value === "string") {
            controller.enqueue(Buffer.from(`Content-Disposition: form-data; name="${key}"\r
\r
`));
            controller.enqueue(Buffer.from(value));
          } else {
            let filenamePart = "";
            if (value.name) {
              filenamePart = `; filename="${value.name}"`;
            }
            controller.enqueue(Buffer.from(`Content-Disposition: form-data; name="${key}"${filenamePart}\r
`));
            controller.enqueue(Buffer.from(`Content-Type: ${value.type || "application/octet-stream"}\r
\r
`));
            const entryStream = value.stream();
            for await (const chunk of entryStream) {
              controller.enqueue(chunk);
            }
          }
          if (entries.length === 0) {
            controller.enqueue(Buffer.from(`\r
--${boundary}--\r
`));
            controller.close();
          } else {
            controller.enqueue(Buffer.from(`\r
--${boundary}\r
`));
          }
        } else {
          controller.enqueue(Buffer.from(`\r
--${boundary}--\r
`));
          controller.close();
        }
      }
    });
  }
  FormData$1.getStreamFromFormData = getStreamFromFormData;
  function getNormalizedFile(name, blob, fileName) {
    Object.defineProperty(blob, "name", {
      configurable: true,
      enumerable: true,
      value: fileName || blob.name || name
    });
    return blob;
  }
  function isBlob(value) {
    return (value == null ? void 0 : value.arrayBuffer) != null;
  }
  return FormData$1;
}
var hasRequiredBody;
function requireBody() {
  if (hasRequiredBody)
    return Body;
  hasRequiredBody = 1;
  Object.defineProperty(Body, "__esModule", { value: true });
  Body.PonyfillBody = void 0;
  const tslib_1 = require$$0;
  const stream_1 = require$$0$1;
  const busboy_1 = tslib_1.__importDefault(requireLib$1());
  const Blob_js_1 = requireBlob();
  const File_js_1 = requireFile();
  const FormData_js_1 = requireFormData();
  const ReadableStream_js_1 = requireReadableStream();
  const utils_js_1 = requireUtils();
  var BodyInitType;
  (function(BodyInitType2) {
    BodyInitType2["ReadableStream"] = "ReadableStream";
    BodyInitType2["Blob"] = "Blob";
    BodyInitType2["FormData"] = "FormData";
    BodyInitType2["String"] = "String";
    BodyInitType2["Readable"] = "Readable";
    BodyInitType2["Buffer"] = "Buffer";
  })(BodyInitType || (BodyInitType = {}));
  class PonyfillBody {
    constructor(bodyInit, options = {}) {
      this.bodyInit = bodyInit;
      this.options = options;
      this.bodyUsed = false;
      this.contentType = null;
      this.contentLength = null;
      this._bodyFactory = () => null;
      this._generatedBody = null;
      const { bodyFactory, contentType, contentLength, bodyType, buffer } = processBodyInit(bodyInit);
      this._bodyFactory = bodyFactory;
      this.contentType = contentType;
      this.contentLength = contentLength;
      this.bodyType = bodyType;
      this._buffer = buffer;
    }
    generateBody() {
      if (this._generatedBody) {
        return this._generatedBody;
      }
      const body = this._bodyFactory();
      this._generatedBody = body;
      return body;
    }
    get body() {
      const _body = this.generateBody();
      if (_body != null) {
        const ponyfillReadableStream = _body;
        const readable = _body.readable;
        return new Proxy(_body.readable, {
          get(_, prop) {
            if (prop in ponyfillReadableStream) {
              const ponyfillReadableStreamProp = ponyfillReadableStream[prop];
              if (typeof ponyfillReadableStreamProp === "function") {
                return ponyfillReadableStreamProp.bind(ponyfillReadableStream);
              }
              return ponyfillReadableStreamProp;
            }
            if (prop in readable) {
              const readableProp = readable[prop];
              if (typeof readableProp === "function") {
                return readableProp.bind(readable);
              }
              return readableProp;
            }
          }
        });
      }
      return null;
    }
    _collectChunksFromReadable() {
      const _body = this.generateBody();
      if (!_body) {
        return (0, utils_js_1.fakePromise)([]);
      }
      const chunks = [];
      _body.readable.on("data", (chunk) => {
        chunks.push(chunk);
      });
      return new Promise((resolve, reject) => {
        _body.readable.once("end", () => {
          resolve(chunks);
        });
        _body.readable.once("error", (e) => {
          reject(e);
        });
      });
    }
    blob() {
      if (this.bodyType === BodyInitType.Blob) {
        return (0, utils_js_1.fakePromise)(this.bodyInit);
      }
      if (this._buffer) {
        const blob = new Blob_js_1.PonyfillBlob([this._buffer], {
          type: this.contentType || "",
          size: this.contentLength
        });
        return (0, utils_js_1.fakePromise)(blob);
      }
      return this._collectChunksFromReadable().then((chunks) => {
        return new Blob_js_1.PonyfillBlob(chunks, {
          type: this.contentType || "",
          size: this.contentLength
        });
      });
    }
    formData(opts) {
      if (this.bodyType === BodyInitType.FormData) {
        return (0, utils_js_1.fakePromise)(this.bodyInit);
      }
      const formData = new FormData_js_1.PonyfillFormData();
      const _body = this.generateBody();
      if (_body == null) {
        return (0, utils_js_1.fakePromise)(formData);
      }
      const formDataLimits = {
        ...this.options.formDataLimits,
        ...opts == null ? void 0 : opts.formDataLimits
      };
      return new Promise((resolve, reject) => {
        const bb = (0, busboy_1.default)({
          headers: {
            "content-type": this.contentType || ""
          },
          limits: formDataLimits,
          defParamCharset: "utf-8"
        });
        bb.on("field", (name, value, { nameTruncated, valueTruncated }) => {
          if (nameTruncated) {
            reject(new Error(`Field name size exceeded: ${formDataLimits == null ? void 0 : formDataLimits.fieldNameSize} bytes`));
          }
          if (valueTruncated) {
            reject(new Error(`Field value size exceeded: ${formDataLimits == null ? void 0 : formDataLimits.fieldSize} bytes`));
          }
          formData.set(name, value);
        });
        bb.on("fieldsLimit", () => {
          reject(new Error(`Fields limit exceeded: ${formDataLimits == null ? void 0 : formDataLimits.fields}`));
        });
        bb.on("file", (name, fileStream, { filename, mimeType }) => {
          const chunks = [];
          fileStream.on("limit", () => {
            reject(new Error(`File size limit exceeded: ${formDataLimits == null ? void 0 : formDataLimits.fileSize} bytes`));
          });
          fileStream.on("data", (chunk) => {
            chunks.push(chunk);
          });
          fileStream.on("close", () => {
            if (fileStream.truncated) {
              reject(new Error(`File size limit exceeded: ${formDataLimits == null ? void 0 : formDataLimits.fileSize} bytes`));
            }
            const file = new File_js_1.PonyfillFile(chunks, filename, { type: mimeType });
            formData.set(name, file);
          });
        });
        bb.on("filesLimit", () => {
          reject(new Error(`Files limit exceeded: ${formDataLimits == null ? void 0 : formDataLimits.files}`));
        });
        bb.on("partsLimit", () => {
          reject(new Error(`Parts limit exceeded: ${formDataLimits == null ? void 0 : formDataLimits.parts}`));
        });
        bb.on("close", () => {
          resolve(formData);
        });
        bb.on("error", (err) => {
          reject(err);
        });
        _body == null ? void 0 : _body.readable.pipe(bb);
      });
    }
    arrayBuffer() {
      if (this._buffer) {
        return (0, utils_js_1.fakePromise)(this._buffer);
      }
      if (this.bodyType === BodyInitType.Blob) {
        if (this.bodyInit instanceof Blob_js_1.PonyfillBlob) {
          return this.bodyInit.arrayBuffer();
        }
        const bodyInitTyped = this.bodyInit;
        return bodyInitTyped.arrayBuffer().then((arrayBuffer) => Buffer.from(arrayBuffer, void 0, bodyInitTyped.size));
      }
      return this._collectChunksFromReadable().then(function concatCollectedChunksFromReadable(chunks) {
        if (chunks.length === 1) {
          return chunks[0];
        }
        return Buffer.concat(chunks);
      });
    }
    json() {
      return this.text().then(function parseTextAsJson(text) {
        return JSON.parse(text);
      });
    }
    text() {
      if (this.bodyType === BodyInitType.String) {
        return (0, utils_js_1.fakePromise)(this.bodyInit);
      }
      return this.arrayBuffer().then((buffer) => buffer.toString("utf-8"));
    }
  }
  Body.PonyfillBody = PonyfillBody;
  function processBodyInit(bodyInit) {
    if (bodyInit == null) {
      return {
        bodyFactory: () => null,
        contentType: null,
        contentLength: null
      };
    }
    if (typeof bodyInit === "string") {
      const buffer = Buffer.from(bodyInit);
      const contentLength = buffer.byteLength;
      return {
        bodyType: BodyInitType.String,
        contentType: "text/plain;charset=UTF-8",
        contentLength,
        buffer,
        bodyFactory() {
          const readable = stream_1.Readable.from(buffer);
          return new ReadableStream_js_1.PonyfillReadableStream(readable);
        }
      };
    }
    if (Buffer.isBuffer(bodyInit)) {
      return {
        bodyType: BodyInitType.Buffer,
        contentType: null,
        contentLength: bodyInit.length,
        buffer: bodyInit,
        bodyFactory() {
          const readable = stream_1.Readable.from(bodyInit);
          const body = new ReadableStream_js_1.PonyfillReadableStream(readable);
          return body;
        }
      };
    }
    if ((0, utils_js_1.isArrayBufferView)(bodyInit)) {
      const buffer = Buffer.from(bodyInit.buffer, bodyInit.byteOffset, bodyInit.byteLength);
      return {
        bodyType: BodyInitType.Buffer,
        contentLength: bodyInit.byteLength,
        contentType: null,
        buffer,
        bodyFactory() {
          const readable = stream_1.Readable.from(buffer);
          const body = new ReadableStream_js_1.PonyfillReadableStream(readable);
          return body;
        }
      };
    }
    if (bodyInit instanceof ReadableStream_js_1.PonyfillReadableStream && bodyInit.readable != null) {
      return {
        bodyType: BodyInitType.ReadableStream,
        bodyFactory: () => bodyInit,
        contentType: null,
        contentLength: null
      };
    }
    if (isBlob(bodyInit)) {
      return {
        bodyType: BodyInitType.Blob,
        contentType: bodyInit.type,
        contentLength: bodyInit.size,
        bodyFactory() {
          return bodyInit.stream();
        }
      };
    }
    if (bodyInit instanceof ArrayBuffer) {
      const contentLength = bodyInit.byteLength;
      const buffer = Buffer.from(bodyInit, void 0, bodyInit.byteLength);
      return {
        bodyType: BodyInitType.Buffer,
        contentType: null,
        contentLength,
        buffer,
        bodyFactory() {
          const readable = stream_1.Readable.from(buffer);
          const body = new ReadableStream_js_1.PonyfillReadableStream(readable);
          return body;
        }
      };
    }
    if (bodyInit instanceof stream_1.Readable) {
      return {
        bodyType: BodyInitType.Readable,
        contentType: null,
        contentLength: null,
        bodyFactory() {
          const body = new ReadableStream_js_1.PonyfillReadableStream(bodyInit);
          return body;
        }
      };
    }
    if (isURLSearchParams(bodyInit)) {
      const contentType = "application/x-www-form-urlencoded;charset=UTF-8";
      return {
        bodyType: BodyInitType.String,
        contentType,
        contentLength: null,
        bodyFactory() {
          const body = new ReadableStream_js_1.PonyfillReadableStream(stream_1.Readable.from(bodyInit.toString()));
          return body;
        }
      };
    }
    if (isFormData(bodyInit)) {
      const boundary = Math.random().toString(36).substr(2);
      const contentType = `multipart/form-data; boundary=${boundary}`;
      return {
        bodyType: BodyInitType.FormData,
        contentType,
        contentLength: null,
        bodyFactory() {
          return (0, FormData_js_1.getStreamFromFormData)(bodyInit, boundary);
        }
      };
    }
    if (isReadableStream(bodyInit)) {
      return {
        contentType: null,
        contentLength: null,
        bodyFactory() {
          return new ReadableStream_js_1.PonyfillReadableStream(bodyInit);
        }
      };
    }
    if (bodyInit[Symbol.iterator] || bodyInit[Symbol.asyncIterator]) {
      return {
        contentType: null,
        contentLength: null,
        bodyFactory() {
          const readable = stream_1.Readable.from(bodyInit);
          return new ReadableStream_js_1.PonyfillReadableStream(readable);
        }
      };
    }
    throw new Error("Unknown body type");
  }
  function isFormData(value) {
    return (value == null ? void 0 : value.forEach) != null;
  }
  function isBlob(value) {
    return (value == null ? void 0 : value.stream) != null;
  }
  function isURLSearchParams(value) {
    return (value == null ? void 0 : value.sort) != null;
  }
  function isReadableStream(value) {
    return (value == null ? void 0 : value.getReader) != null;
  }
  return Body;
}
var Headers$1 = {};
var hasRequiredHeaders;
function requireHeaders() {
  if (hasRequiredHeaders)
    return Headers$1;
  hasRequiredHeaders = 1;
  Object.defineProperty(Headers$1, "__esModule", { value: true });
  Headers$1.PonyfillHeaders = Headers$1.isHeadersLike = void 0;
  const node_util_1 = require$$0$2;
  function isHeadersLike(headers) {
    return (headers == null ? void 0 : headers.get) && (headers == null ? void 0 : headers.forEach);
  }
  Headers$1.isHeadersLike = isHeadersLike;
  class PonyfillHeaders {
    constructor(headersInit) {
      this.headersInit = headersInit;
      this.objectNormalizedKeysOfHeadersInit = [];
      this.objectOriginalKeysOfHeadersInit = [];
      this._setCookies = [];
    }
    // perf: we don't need to build `this.map` for Requests, as we can access the headers directly
    _get(key) {
      var _a;
      const normalized = key.toLowerCase();
      if (normalized === "set-cookie") {
        return this._setCookies.join(", ");
      }
      if (this._map) {
        return this._map.get(normalized) || null;
      }
      if (this.headersInit == null) {
        return null;
      }
      if (Array.isArray(this.headersInit)) {
        return ((_a = this.headersInit.find((header) => header[0].toLowerCase() === normalized)) == null ? void 0 : _a[1]) || null;
      } else if (isHeadersLike(this.headersInit)) {
        return this.headersInit.get(normalized);
      } else {
        const initValue = this.headersInit[key] || this.headersInit[normalized];
        if (initValue != null) {
          return initValue;
        }
        if (!this.objectNormalizedKeysOfHeadersInit.length) {
          Object.keys(this.headersInit).forEach((k) => {
            this.objectOriginalKeysOfHeadersInit.push(k);
            this.objectNormalizedKeysOfHeadersInit.push(k.toLowerCase());
          });
        }
        const index = this.objectNormalizedKeysOfHeadersInit.indexOf(normalized);
        if (index === -1) {
          return null;
        }
        const originalKey = this.objectOriginalKeysOfHeadersInit[index];
        return this.headersInit[originalKey];
      }
    }
    // perf: Build the map of headers lazily, only when we need to access all headers or write to it.
    // I could do a getter here, but I'm too lazy to type `getter`.
    getMap() {
      if (!this._map) {
        if (this.headersInit != null) {
          if (Array.isArray(this.headersInit)) {
            this._map = /* @__PURE__ */ new Map();
            this.headersInit.forEach(([key, value]) => {
              const normalizedKey = key.toLowerCase();
              if (normalizedKey === "set-cookie") {
                this._setCookies.push(value);
                return;
              }
              this._map.set(normalizedKey, value);
            });
          } else if (isHeadersLike(this.headersInit)) {
            this._map = /* @__PURE__ */ new Map();
            this.headersInit.forEach((value, key) => {
              if (key === "set-cookie") {
                this._setCookies.push(value);
                return;
              }
              this._map.set(key, value);
            });
          } else {
            this._map = /* @__PURE__ */ new Map();
            for (const initKey in this.headersInit) {
              const initValue = this.headersInit[initKey];
              if (initValue != null) {
                const normalizedKey = initKey.toLowerCase();
                if (normalizedKey === "set-cookie") {
                  this._setCookies.push(initValue);
                  continue;
                }
                this._map.set(normalizedKey, initValue);
              }
            }
          }
        } else {
          this._map = /* @__PURE__ */ new Map();
        }
      }
      return this._map;
    }
    append(name, value) {
      const key = name.toLowerCase();
      if (key === "set-cookie") {
        this._setCookies.push(value);
        return;
      }
      const existingValue = this.getMap().get(key);
      const finalValue = existingValue ? `${existingValue}, ${value}` : value;
      this.getMap().set(key, finalValue);
    }
    get(name) {
      const value = this._get(name);
      if (value == null) {
        return null;
      }
      return value;
    }
    has(name) {
      if (name === "set-cookie") {
        return this._setCookies.length > 0;
      }
      return !!this._get(name);
    }
    set(name, value) {
      const key = name.toLowerCase();
      if (key === "set-cookie") {
        this._setCookies = [value];
        return;
      }
      this.getMap().set(key, value);
    }
    delete(name) {
      const key = name.toLowerCase();
      if (key === "set-cookie") {
        this._setCookies = [];
        return;
      }
      this.getMap().delete(key);
    }
    forEach(callback) {
      this._setCookies.forEach((setCookie) => {
        callback(setCookie, "set-cookie", this);
      });
      if (!this._map) {
        if (this.headersInit) {
          if (Array.isArray(this.headersInit)) {
            this.headersInit.forEach(([key, value]) => {
              callback(value, key, this);
            });
            return;
          }
          if (isHeadersLike(this.headersInit)) {
            this.headersInit.forEach(callback);
            return;
          }
          Object.entries(this.headersInit).forEach(([key, value]) => {
            if (value != null) {
              callback(value, key, this);
            }
          });
        }
        return;
      }
      this.getMap().forEach((value, key) => {
        callback(value, key, this);
      });
    }
    *keys() {
      if (this._setCookies.length) {
        yield "set-cookie";
      }
      if (!this._map) {
        if (this.headersInit) {
          if (Array.isArray(this.headersInit)) {
            yield* this.headersInit.map(([key]) => key)[Symbol.iterator]();
            return;
          }
          if (isHeadersLike(this.headersInit)) {
            yield* this.headersInit.keys();
            return;
          }
          yield* Object.keys(this.headersInit)[Symbol.iterator]();
          return;
        }
      }
      yield* this.getMap().keys();
    }
    *values() {
      yield* this._setCookies;
      if (!this._map) {
        if (this.headersInit) {
          if (Array.isArray(this.headersInit)) {
            yield* this.headersInit.map(([, value]) => value)[Symbol.iterator]();
            return;
          }
          if (isHeadersLike(this.headersInit)) {
            yield* this.headersInit.values();
            return;
          }
          yield* Object.values(this.headersInit)[Symbol.iterator]();
          return;
        }
      }
      yield* this.getMap().values();
    }
    *entries() {
      yield* this._setCookies.map((cookie) => ["set-cookie", cookie]);
      if (!this._map) {
        if (this.headersInit) {
          if (Array.isArray(this.headersInit)) {
            yield* this.headersInit;
            return;
          }
          if (isHeadersLike(this.headersInit)) {
            yield* this.headersInit.entries();
            return;
          }
          yield* Object.entries(this.headersInit);
          return;
        }
      }
      yield* this.getMap().entries();
    }
    getSetCookie() {
      return this._setCookies;
    }
    [Symbol.iterator]() {
      return this.entries();
    }
    [Symbol.for("nodejs.util.inspect.custom")]() {
      const record = {};
      this.forEach((value, key) => {
        if (key === "set-cookie") {
          record["set-cookie"] = this._setCookies;
        } else {
          record[key] = value.includes(",") ? value.split(",").map((el) => el.trim()) : value;
        }
      });
      return `Headers ${(0, node_util_1.inspect)(record)}`;
    }
  }
  Headers$1.PonyfillHeaders = PonyfillHeaders;
  return Headers$1;
}
var hasRequiredResponse;
function requireResponse() {
  if (hasRequiredResponse)
    return Response$1;
  hasRequiredResponse = 1;
  Object.defineProperty(Response$1, "__esModule", { value: true });
  Response$1.PonyfillResponse = void 0;
  const http_1 = require$$0$3;
  const Body_js_1 = requireBody();
  const Headers_js_1 = requireHeaders();
  const JSON_CONTENT_TYPE = "application/json; charset=utf-8";
  class PonyfillResponse extends Body_js_1.PonyfillBody {
    constructor(body, init) {
      super(body || null, init);
      this.headers = (init == null ? void 0 : init.headers) && (0, Headers_js_1.isHeadersLike)(init.headers) ? init.headers : new Headers_js_1.PonyfillHeaders(init == null ? void 0 : init.headers);
      this.status = (init == null ? void 0 : init.status) || 200;
      this.statusText = (init == null ? void 0 : init.statusText) || http_1.STATUS_CODES[this.status] || "OK";
      this.url = (init == null ? void 0 : init.url) || "";
      this.redirected = (init == null ? void 0 : init.redirected) || false;
      this.type = (init == null ? void 0 : init.type) || "default";
      const contentTypeInHeaders = this.headers.get("content-type");
      if (!contentTypeInHeaders) {
        if (this.contentType) {
          this.headers.set("content-type", this.contentType);
        }
      } else {
        this.contentType = contentTypeInHeaders;
      }
      const contentLengthInHeaders = this.headers.get("content-length");
      if (!contentLengthInHeaders) {
        if (this.contentLength) {
          this.headers.set("content-length", this.contentLength.toString());
        }
      } else {
        this.contentLength = parseInt(contentLengthInHeaders, 10);
      }
    }
    get ok() {
      return this.status >= 200 && this.status < 300;
    }
    clone() {
      return new PonyfillResponse(this.body, this);
    }
    static error() {
      return new PonyfillResponse(null, {
        status: 500,
        statusText: "Internal Server Error"
      });
    }
    static redirect(url, status = 301) {
      if (status < 300 || status > 399) {
        throw new RangeError("Invalid status code");
      }
      return new PonyfillResponse(null, {
        headers: {
          location: url
        },
        status
      });
    }
    static json(data, init = {}) {
      init.headers = (init == null ? void 0 : init.headers) && (0, Headers_js_1.isHeadersLike)(init.headers) ? init.headers : new Headers_js_1.PonyfillHeaders(init == null ? void 0 : init.headers);
      if (!init.headers.has("content-type")) {
        init.headers.set("content-type", JSON_CONTENT_TYPE);
      }
      return new PonyfillResponse(JSON.stringify(data), init);
    }
  }
  Response$1.PonyfillResponse = PonyfillResponse;
  return Response$1;
}
var hasRequiredFetchCurl;
function requireFetchCurl() {
  if (hasRequiredFetchCurl)
    return fetchCurl;
  hasRequiredFetchCurl = 1;
  Object.defineProperty(fetchCurl, "__esModule", { value: true });
  fetchCurl.fetchCurl = void 0;
  const node_stream_1 = require$$0$4;
  const Response_js_1 = requireResponse();
  const utils_js_1 = requireUtils();
  function fetchCurl$1(fetchRequest) {
    const { Curl, CurlFeature, CurlPause, CurlProgressFunc } = globalThis["libcurl"];
    const curlHandle = new Curl();
    curlHandle.enable(CurlFeature.NoDataParsing);
    curlHandle.setOpt("URL", fetchRequest.url);
    curlHandle.setOpt("SSL_VERIFYPEER", false);
    curlHandle.enable(CurlFeature.StreamResponse);
    curlHandle.setStreamProgressCallback(function() {
      var _a;
      return ((_a = fetchRequest["_signal"]) == null ? void 0 : _a.aborted) ? process.env.DEBUG ? CurlProgressFunc.Continue : 1 : 0;
    });
    if (fetchRequest["bodyType"] === "String") {
      curlHandle.setOpt("POSTFIELDS", fetchRequest["bodyInit"]);
    } else {
      const nodeReadable = fetchRequest.body != null ? (0, utils_js_1.isNodeReadable)(fetchRequest.body) ? fetchRequest.body : node_stream_1.Readable.from(fetchRequest.body) : null;
      if (nodeReadable) {
        curlHandle.setOpt("UPLOAD", true);
        curlHandle.setUploadStream(nodeReadable);
      }
    }
    if (process.env.DEBUG) {
      curlHandle.setOpt("VERBOSE", true);
    }
    curlHandle.setOpt("TRANSFER_ENCODING", false);
    curlHandle.setOpt("HTTP_TRANSFER_DECODING", true);
    curlHandle.setOpt("FOLLOWLOCATION", fetchRequest.redirect === "follow");
    curlHandle.setOpt("MAXREDIRS", 20);
    curlHandle.setOpt("ACCEPT_ENCODING", "");
    curlHandle.setOpt("CUSTOMREQUEST", fetchRequest.method);
    const headersSerializer = fetchRequest.headersSerializer || utils_js_1.defaultHeadersSerializer;
    let size;
    const curlHeaders = headersSerializer(fetchRequest.headers, (value) => {
      size = Number(value);
    });
    if (size != null) {
      curlHandle.setOpt("INFILESIZE", size);
    }
    curlHandle.setOpt("HTTPHEADER", curlHeaders);
    curlHandle.enable(CurlFeature.NoHeaderParsing);
    return new Promise(function promiseResolver(resolve, reject) {
      let streamResolved;
      if (fetchRequest["_signal"]) {
        fetchRequest["_signal"].onabort = () => {
          if (curlHandle.isOpen) {
            curlHandle.pause(CurlPause.Recv);
          }
        };
      }
      curlHandle.once("end", function endListener() {
        curlHandle.close();
      });
      curlHandle.once("error", function errorListener(error) {
        if (streamResolved && !streamResolved.closed && !streamResolved.destroyed) {
          streamResolved.destroy(error);
        } else {
          reject(error);
        }
        curlHandle.close();
      });
      curlHandle.once("stream", function streamListener(stream, status, headersBuf) {
        const headersFlat = headersBuf.toString("utf8").split(/\r?\n|\r/g).filter((headerFilter) => {
          if (headerFilter && !headerFilter.startsWith("HTTP/")) {
            if (fetchRequest.redirect === "error" && (headerFilter.includes("location") || headerFilter.includes("Location"))) {
              stream.destroy();
              reject(new Error("redirect is not allowed"));
            }
            return true;
          }
          return false;
        });
        const headersInit = headersFlat.map((headerFlat) => headerFlat.split(/:\s(.+)/).slice(0, 2));
        resolve(new Response_js_1.PonyfillResponse(stream, {
          status,
          headers: headersInit,
          url: fetchRequest.url
        }));
        streamResolved = stream;
      });
      curlHandle.perform();
    });
  }
  fetchCurl.fetchCurl = fetchCurl$1;
  return fetchCurl;
}
var fetchNodeHttp = {};
var Request$1 = {};
var hasRequiredRequest;
function requireRequest() {
  if (hasRequiredRequest)
    return Request$1;
  hasRequiredRequest = 1;
  var _a;
  Object.defineProperty(Request$1, "__esModule", { value: true });
  Request$1.PonyfillRequest = void 0;
  const Body_js_1 = requireBody();
  const Headers_js_1 = requireHeaders();
  function isRequest(input) {
    return input[Symbol.toStringTag] === "Request";
  }
  function isURL(obj) {
    return (obj == null ? void 0 : obj.href) != null;
  }
  class PonyfillRequest extends Body_js_1.PonyfillBody {
    constructor(input, options) {
      var _a2;
      let url;
      let bodyInit = null;
      let requestInit;
      if (typeof input === "string") {
        url = input;
      } else if (isURL(input)) {
        url = input.toString();
      } else if (isRequest(input)) {
        url = input.url;
        bodyInit = input.body;
        requestInit = input;
      }
      if (options != null) {
        bodyInit = options.body || null;
        requestInit = options;
      }
      super(bodyInit, options);
      this[_a] = "Request";
      this.cache = (requestInit == null ? void 0 : requestInit.cache) || "default";
      this.credentials = (requestInit == null ? void 0 : requestInit.credentials) || "same-origin";
      this.headers = (requestInit == null ? void 0 : requestInit.headers) && (0, Headers_js_1.isHeadersLike)(requestInit.headers) ? requestInit.headers : new Headers_js_1.PonyfillHeaders(requestInit == null ? void 0 : requestInit.headers);
      this.integrity = (requestInit == null ? void 0 : requestInit.integrity) || "";
      this.keepalive = (requestInit == null ? void 0 : requestInit.keepalive) != null ? requestInit == null ? void 0 : requestInit.keepalive : false;
      this.method = ((_a2 = requestInit == null ? void 0 : requestInit.method) == null ? void 0 : _a2.toUpperCase()) || "GET";
      this.mode = (requestInit == null ? void 0 : requestInit.mode) || "cors";
      this.redirect = (requestInit == null ? void 0 : requestInit.redirect) || "follow";
      this.referrer = (requestInit == null ? void 0 : requestInit.referrer) || "about:client";
      this.referrerPolicy = (requestInit == null ? void 0 : requestInit.referrerPolicy) || "no-referrer";
      this._signal = requestInit == null ? void 0 : requestInit.signal;
      this.headersSerializer = requestInit == null ? void 0 : requestInit.headersSerializer;
      this.duplex = (requestInit == null ? void 0 : requestInit.duplex) || "half";
      this.url = url || "";
      this.destination = "document";
      this.priority = "auto";
      if (this.method !== "GET" && this.method !== "HEAD") {
        const contentTypeInHeaders = this.headers.get("content-type");
        if (!contentTypeInHeaders) {
          if (this.contentType) {
            this.headers.set("content-type", this.contentType);
          }
        } else {
          this.contentType = contentTypeInHeaders;
        }
        const contentLengthInHeaders = this.headers.get("content-length");
        if (!contentLengthInHeaders) {
          if (this.contentLength) {
            this.headers.set("content-length", this.contentLength.toString());
          }
        } else {
          this.contentLength = parseInt(contentLengthInHeaders, 10);
        }
      }
    }
    get signal() {
      if (!this._signal) {
        this._signal = new AbortController().signal;
      }
      return this._signal;
    }
    clone() {
      return new PonyfillRequest(this);
    }
  }
  Request$1.PonyfillRequest = PonyfillRequest;
  _a = Symbol.toStringTag;
  return Request$1;
}
var URL$2 = {};
var lib = { exports: {} };
var fastDecodeUriComponent;
var hasRequiredFastDecodeUriComponent;
function requireFastDecodeUriComponent() {
  if (hasRequiredFastDecodeUriComponent)
    return fastDecodeUriComponent;
  hasRequiredFastDecodeUriComponent = 1;
  var UTF8_ACCEPT = 12;
  var UTF8_REJECT = 0;
  var UTF8_DATA = [
    // The first part of the table maps bytes to character to a transition.
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    4,
    4,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    6,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    7,
    8,
    7,
    7,
    10,
    9,
    9,
    9,
    11,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    4,
    // The second part of the table maps a state to a new state when adding a
    // transition.
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    12,
    0,
    0,
    0,
    0,
    24,
    36,
    48,
    60,
    72,
    84,
    96,
    0,
    12,
    12,
    12,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    24,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    24,
    24,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    48,
    48,
    48,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    48,
    48,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    48,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    // The third part maps the current transition to a mask that needs to apply
    // to the byte.
    127,
    63,
    63,
    63,
    0,
    31,
    15,
    15,
    15,
    7,
    7,
    7
  ];
  function decodeURIComponent2(uri) {
    var percentPosition = uri.indexOf("%");
    if (percentPosition === -1)
      return uri;
    var length = uri.length;
    var decoded = "";
    var last = 0;
    var codepoint = 0;
    var startOfOctets = percentPosition;
    var state = UTF8_ACCEPT;
    while (percentPosition > -1 && percentPosition < length) {
      var high = hexCodeToInt(uri[percentPosition + 1], 4);
      var low = hexCodeToInt(uri[percentPosition + 2], 0);
      var byte = high | low;
      var type = UTF8_DATA[byte];
      state = UTF8_DATA[256 + state + type];
      codepoint = codepoint << 6 | byte & UTF8_DATA[364 + type];
      if (state === UTF8_ACCEPT) {
        decoded += uri.slice(last, startOfOctets);
        decoded += codepoint <= 65535 ? String.fromCharCode(codepoint) : String.fromCharCode(
          55232 + (codepoint >> 10),
          56320 + (codepoint & 1023)
        );
        codepoint = 0;
        last = percentPosition + 3;
        percentPosition = startOfOctets = uri.indexOf("%", last);
      } else if (state === UTF8_REJECT) {
        return null;
      } else {
        percentPosition += 3;
        if (percentPosition < length && uri.charCodeAt(percentPosition) === 37)
          continue;
        return null;
      }
    }
    return decoded + uri.slice(last);
  }
  var HEX = {
    "0": 0,
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "a": 10,
    "A": 10,
    "b": 11,
    "B": 11,
    "c": 12,
    "C": 12,
    "d": 13,
    "D": 13,
    "e": 14,
    "E": 14,
    "f": 15,
    "F": 15
  };
  function hexCodeToInt(c, shift) {
    var i = HEX[c];
    return i === void 0 ? 255 : i << shift;
  }
  fastDecodeUriComponent = decodeURIComponent2;
  return fastDecodeUriComponent;
}
var parse_1;
var hasRequiredParse;
function requireParse() {
  if (hasRequiredParse)
    return parse_1;
  hasRequiredParse = 1;
  const fastDecode = requireFastDecodeUriComponent();
  const plusRegex = /\+/g;
  const Empty = function() {
  };
  Empty.prototype = /* @__PURE__ */ Object.create(null);
  function parse2(input) {
    const result = new Empty();
    if (typeof input !== "string") {
      return result;
    }
    let inputLength = input.length;
    let key = "";
    let value = "";
    let startingIndex = -1;
    let equalityIndex = -1;
    let shouldDecodeKey = false;
    let shouldDecodeValue = false;
    let keyHasPlus = false;
    let valueHasPlus = false;
    let hasBothKeyValuePair = false;
    let c = 0;
    for (let i = 0; i < inputLength + 1; i++) {
      c = i !== inputLength ? input.charCodeAt(i) : 38;
      if (c === 38) {
        hasBothKeyValuePair = equalityIndex > startingIndex;
        if (!hasBothKeyValuePair) {
          equalityIndex = i;
        }
        key = input.slice(startingIndex + 1, equalityIndex);
        if (hasBothKeyValuePair || key.length > 0) {
          if (keyHasPlus) {
            key = key.replace(plusRegex, " ");
          }
          if (shouldDecodeKey) {
            key = fastDecode(key) || key;
          }
          if (hasBothKeyValuePair) {
            value = input.slice(equalityIndex + 1, i);
            if (valueHasPlus) {
              value = value.replace(plusRegex, " ");
            }
            if (shouldDecodeValue) {
              value = fastDecode(value) || value;
            }
          }
          const currentValue = result[key];
          if (currentValue === void 0) {
            result[key] = value;
          } else {
            if (currentValue.pop) {
              currentValue.push(value);
            } else {
              result[key] = [currentValue, value];
            }
          }
        }
        value = "";
        startingIndex = i;
        equalityIndex = i;
        shouldDecodeKey = false;
        shouldDecodeValue = false;
        keyHasPlus = false;
        valueHasPlus = false;
      } else if (c === 61) {
        if (equalityIndex <= startingIndex) {
          equalityIndex = i;
        } else {
          shouldDecodeValue = true;
        }
      } else if (c === 43) {
        if (equalityIndex > startingIndex) {
          valueHasPlus = true;
        } else {
          keyHasPlus = true;
        }
      } else if (c === 37) {
        if (equalityIndex > startingIndex) {
          shouldDecodeValue = true;
        } else {
          shouldDecodeKey = true;
        }
      }
    }
    return result;
  }
  parse_1 = parse2;
  return parse_1;
}
var querystring;
var hasRequiredQuerystring;
function requireQuerystring() {
  if (hasRequiredQuerystring)
    return querystring;
  hasRequiredQuerystring = 1;
  const hexTable = Array.from(
    { length: 256 },
    (_, i) => "%" + ((i < 16 ? "0" : "") + i.toString(16)).toUpperCase()
  );
  const noEscape = new Int8Array([
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    // 0 - 15
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    // 16 - 31
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    1,
    1,
    1,
    0,
    0,
    1,
    1,
    0,
    // 32 - 47
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    // 48 - 63
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    // 64 - 79
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    1,
    // 80 - 95
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    // 96 - 111
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    1,
    0
    // 112 - 127
  ]);
  function encodeString(str) {
    const len = str.length;
    if (len === 0)
      return "";
    let out = "";
    let lastPos = 0;
    let i = 0;
    outer:
      for (; i < len; i++) {
        let c = str.charCodeAt(i);
        while (c < 128) {
          if (noEscape[c] !== 1) {
            if (lastPos < i)
              out += str.slice(lastPos, i);
            lastPos = i + 1;
            out += hexTable[c];
          }
          if (++i === len)
            break outer;
          c = str.charCodeAt(i);
        }
        if (lastPos < i)
          out += str.slice(lastPos, i);
        if (c < 2048) {
          lastPos = i + 1;
          out += hexTable[192 | c >> 6] + hexTable[128 | c & 63];
          continue;
        }
        if (c < 55296 || c >= 57344) {
          lastPos = i + 1;
          out += hexTable[224 | c >> 12] + hexTable[128 | c >> 6 & 63] + hexTable[128 | c & 63];
          continue;
        }
        ++i;
        if (i >= len) {
          throw new Error("URI malformed");
        }
        const c2 = str.charCodeAt(i) & 1023;
        lastPos = i + 1;
        c = 65536 + ((c & 1023) << 10 | c2);
        out += hexTable[240 | c >> 18] + hexTable[128 | c >> 12 & 63] + hexTable[128 | c >> 6 & 63] + hexTable[128 | c & 63];
      }
    if (lastPos === 0)
      return str;
    if (lastPos < len)
      return out + str.slice(lastPos);
    return out;
  }
  querystring = { encodeString };
  return querystring;
}
var stringify_1;
var hasRequiredStringify;
function requireStringify() {
  if (hasRequiredStringify)
    return stringify_1;
  hasRequiredStringify = 1;
  const { encodeString } = requireQuerystring();
  function getAsPrimitive(value) {
    const type = typeof value;
    if (type === "string") {
      return encodeString(value);
    } else if (type === "bigint") {
      return value.toString();
    } else if (type === "boolean") {
      return value ? "true" : "false";
    } else if (type === "number" && Number.isFinite(value)) {
      return value < 1e21 ? "" + value : encodeString("" + value);
    }
    return "";
  }
  function stringify(input) {
    let result = "";
    if (input === null || typeof input !== "object") {
      return result;
    }
    const separator = "&";
    const keys = Object.keys(input);
    const keyLength = keys.length;
    let valueLength = 0;
    for (let i = 0; i < keyLength; i++) {
      const key = keys[i];
      const value = input[key];
      const encodedKey = encodeString(key) + "=";
      if (i) {
        result += separator;
      }
      if (Array.isArray(value)) {
        valueLength = value.length;
        for (let j = 0; j < valueLength; j++) {
          if (j) {
            result += separator;
          }
          result += encodedKey;
          result += getAsPrimitive(value[j]);
        }
      } else {
        result += encodedKey;
        result += getAsPrimitive(value);
      }
    }
    return result;
  }
  stringify_1 = stringify;
  return stringify_1;
}
var hasRequiredLib;
function requireLib() {
  if (hasRequiredLib)
    return lib.exports;
  hasRequiredLib = 1;
  const parse2 = requireParse();
  const stringify = requireStringify();
  const fastQuerystring = {
    parse: parse2,
    stringify
  };
  lib.exports = fastQuerystring;
  lib.exports.default = fastQuerystring;
  lib.exports.parse = parse2;
  lib.exports.stringify = stringify;
  return lib.exports;
}
var punycode;
var hasRequiredPunycode;
function requirePunycode() {
  if (hasRequiredPunycode)
    return punycode;
  hasRequiredPunycode = 1;
  var maxInt = 2147483647;
  var base = 36;
  var tMin = 1;
  var tMax = 26;
  var skew = 38;
  var damp = 700;
  var initialBias = 72;
  var initialN = 128;
  var delimiter = "-";
  var regexNonASCII = /[^\0-\x7F]/;
  var regexSeparators = /[\x2E\u3002\uFF0E\uFF61]/g;
  var errors = {
    "overflow": "Overflow: input needs wider integers to process",
    "not-basic": "Illegal input >= 0x80 (not a basic code point)",
    "invalid-input": "Invalid input"
  };
  var baseMinusTMin = base - tMin;
  var floor = Math.floor;
  var stringFromCharCode = String.fromCharCode;
  function error(type) {
    throw new RangeError(errors[type]);
  }
  function map(array, callback) {
    var result = [];
    var length = array.length;
    while (length--) {
      result[length] = callback(array[length]);
    }
    return result;
  }
  function mapDomain(domain, callback) {
    var parts = domain.split("@");
    var result = "";
    if (parts.length > 1) {
      result = parts[0] + "@";
      domain = parts[1];
    }
    domain = domain.replace(regexSeparators, ".");
    var labels = domain.split(".");
    var encoded = map(labels, callback).join(".");
    return result + encoded;
  }
  function ucs2decode(string) {
    var output = [];
    var counter = 0;
    var length = string.length;
    while (counter < length) {
      var value = string.charCodeAt(counter++);
      if (value >= 55296 && value <= 56319 && counter < length) {
        var extra = string.charCodeAt(counter++);
        if ((extra & 64512) === 56320) {
          output.push(((value & 1023) << 10) + (extra & 1023) + 65536);
        } else {
          output.push(value);
          counter--;
        }
      } else {
        output.push(value);
      }
    }
    return output;
  }
  var digitToBasic = function(digit, flag) {
    return digit + 22 + 75 * (digit < 26) - ((flag !== 0) << 5);
  };
  var adapt = function(delta, numPoints, firstTime) {
    var k = 0;
    delta = firstTime ? floor(delta / damp) : delta >> 1;
    delta += floor(delta / numPoints);
    for (
      ;
      /* no initialization */
      delta > baseMinusTMin * tMax >> 1;
      k += base
    ) {
      delta = floor(delta / baseMinusTMin);
    }
    return floor(k + (baseMinusTMin + 1) * delta / (delta + skew));
  };
  var encode = function(input) {
    var output = [];
    input = ucs2decode(input);
    var inputLength = input.length;
    var n = initialN;
    var delta = 0;
    var bias = initialBias;
    for (var currentValue of input) {
      if (currentValue < 128) {
        output.push(stringFromCharCode(currentValue));
      }
    }
    var basicLength = output.length;
    var handledCPCount = basicLength;
    if (basicLength) {
      output.push(delimiter);
    }
    while (handledCPCount < inputLength) {
      var m = maxInt;
      for (var currentValue of input) {
        if (currentValue >= n && currentValue < m) {
          m = currentValue;
        }
      }
      var handledCPCountPlusOne = handledCPCount + 1;
      if (m - n > floor((maxInt - delta) / handledCPCountPlusOne)) {
        error("overflow");
      }
      delta += (m - n) * handledCPCountPlusOne;
      n = m;
      for (var currentValue of input) {
        if (currentValue < n && ++delta > maxInt) {
          error("overflow");
        }
        if (currentValue === n) {
          var q = delta;
          for (var k = base; ; k += base) {
            var t = k <= bias ? tMin : k >= bias + tMax ? tMax : k - bias;
            if (q < t) {
              break;
            }
            var qMinusT = q - t;
            var baseMinusT = base - t;
            output.push(stringFromCharCode(digitToBasic(t + qMinusT % baseMinusT, 0)));
            q = floor(qMinusT / baseMinusT);
          }
          output.push(stringFromCharCode(digitToBasic(q, 0)));
          bias = adapt(delta, handledCPCountPlusOne, handledCPCount === basicLength);
          delta = 0;
          ++handledCPCount;
        }
      }
      ++delta;
      ++n;
    }
    return output.join("");
  };
  var toASCII = function(input) {
    return mapDomain(input, function(string) {
      return regexNonASCII.test(string) ? "xn--" + encode(string) : string;
    });
  };
  punycode = {
    toASCII
  };
  return punycode;
}
var urlparser;
var hasRequiredUrlparser;
function requireUrlparser() {
  if (hasRequiredUrlparser)
    return urlparser;
  hasRequiredUrlparser = 1;
  function Url() {
    this._protocol = null;
    this._href = "";
    this._port = -1;
    this._query = null;
    this.auth = null;
    this.slashes = null;
    this.host = null;
    this.hostname = null;
    this.hash = null;
    this.search = null;
    this.pathname = null;
    this._prependSlash = false;
  }
  var querystring2 = require$$0$5;
  Url.queryString = querystring2;
  Url.prototype.parse = function Url$parse(str, parseQueryString, hostDenotesSlash, disableAutoEscapeChars) {
    if (typeof str !== "string") {
      throw new TypeError("Parameter 'url' must be a string, not " + typeof str);
    }
    var start = 0;
    var end = str.length - 1;
    while (str.charCodeAt(start) <= 32)
      start++;
    while (str.charCodeAt(end) <= 32)
      end--;
    start = this._parseProtocol(str, start, end);
    if (this._protocol !== "javascript") {
      start = this._parseHost(str, start, end, hostDenotesSlash);
      var proto = this._protocol;
      if (!this.hostname && (this.slashes || proto && !slashProtocols[proto])) {
        this.hostname = this.host = "";
      }
    }
    if (start <= end) {
      var ch = str.charCodeAt(start);
      if (ch === 47 || ch === 92) {
        this._parsePath(str, start, end, disableAutoEscapeChars);
      } else if (ch === 63) {
        this._parseQuery(str, start, end, disableAutoEscapeChars);
      } else if (ch === 35) {
        this._parseHash(str, start, end, disableAutoEscapeChars);
      } else if (this._protocol !== "javascript") {
        this._parsePath(str, start, end, disableAutoEscapeChars);
      } else {
        this.pathname = str.slice(start, end + 1);
      }
    }
    if (!this.pathname && this.hostname && this._slashProtocols[this._protocol]) {
      this.pathname = "/";
    }
    if (parseQueryString) {
      var search = this.search;
      if (search == null) {
        search = this.search = "";
      }
      if (search.charCodeAt(0) === 63) {
        search = search.slice(1);
      }
      this.query = Url.queryString.parse(search);
    }
  };
  Url.prototype.resolve = function Url$resolve(relative) {
    return this.resolveObject(Url.parse(relative, false, true)).format();
  };
  Url.prototype.format = function Url$format() {
    var auth = this.auth || "";
    if (auth) {
      auth = encodeURIComponent(auth);
      auth = auth.replace(/%3A/i, ":");
      auth += "@";
    }
    var protocol = this.protocol || "";
    var pathname = this.pathname || "";
    var hash = this.hash || "";
    var search = this.search || "";
    var query = "";
    var hostname2 = this.hostname || "";
    var port = this.port || "";
    var host = false;
    var scheme = "";
    var q = this.query;
    if (q && typeof q === "object") {
      query = Url.queryString.stringify(q);
    }
    if (!search) {
      search = query ? "?" + query : "";
    }
    if (protocol && protocol.charCodeAt(protocol.length - 1) !== 58)
      protocol += ":";
    if (this.host) {
      host = auth + this.host;
    } else if (hostname2) {
      var ip6 = hostname2.indexOf(":") > -1;
      if (ip6)
        hostname2 = "[" + hostname2 + "]";
      host = auth + hostname2 + (port ? ":" + port : "");
    }
    var slashes = this.slashes || (!protocol || slashProtocols[protocol]) && host !== false;
    if (protocol)
      scheme = protocol + (slashes ? "//" : "");
    else if (slashes)
      scheme = "//";
    if (slashes && pathname && pathname.charCodeAt(0) !== 47) {
      pathname = "/" + pathname;
    }
    if (search && search.charCodeAt(0) !== 63)
      search = "?" + search;
    if (hash && hash.charCodeAt(0) !== 35)
      hash = "#" + hash;
    pathname = escapePathName(pathname);
    search = escapeSearch(search);
    return scheme + (host === false ? "" : host) + pathname + search + hash;
  };
  Url.prototype.resolveObject = function Url$resolveObject(relative) {
    if (typeof relative === "string")
      relative = Url.parse(relative, false, true);
    var result = this._clone();
    result.hash = relative.hash;
    if (!relative.href) {
      result._href = "";
      return result;
    }
    if (relative.slashes && !relative._protocol) {
      relative._copyPropsTo(result, true);
      if (slashProtocols[result._protocol] && result.hostname && !result.pathname) {
        result.pathname = "/";
      }
      result._href = "";
      return result;
    }
    if (relative._protocol && relative._protocol !== result._protocol) {
      if (!slashProtocols[relative._protocol]) {
        relative._copyPropsTo(result, false);
        result._href = "";
        return result;
      }
      result._protocol = relative._protocol;
      if (!relative.host && relative._protocol !== "javascript") {
        var relPath = (relative.pathname || "").split("/");
        while (relPath.length && !(relative.host = relPath.shift()))
          ;
        if (!relative.host)
          relative.host = "";
        if (!relative.hostname)
          relative.hostname = "";
        if (relPath[0] !== "")
          relPath.unshift("");
        if (relPath.length < 2)
          relPath.unshift("");
        result.pathname = relPath.join("/");
      } else {
        result.pathname = relative.pathname;
      }
      result.search = relative.search;
      result.host = relative.host || "";
      result.auth = relative.auth;
      result.hostname = relative.hostname || relative.host;
      result._port = relative._port;
      result.slashes = result.slashes || relative.slashes;
      result._href = "";
      return result;
    }
    var isSourceAbs = result.pathname && result.pathname.charCodeAt(0) === 47;
    var isRelAbs = relative.host || relative.pathname && relative.pathname.charCodeAt(0) === 47;
    var mustEndAbs = isRelAbs || isSourceAbs || result.host && relative.pathname;
    var removeAllDots = mustEndAbs;
    var srcPath = result.pathname && result.pathname.split("/") || [];
    var relPath = relative.pathname && relative.pathname.split("/") || [];
    var psychotic = result._protocol && !slashProtocols[result._protocol];
    if (psychotic) {
      result.hostname = "";
      result._port = -1;
      if (result.host) {
        if (srcPath[0] === "")
          srcPath[0] = result.host;
        else
          srcPath.unshift(result.host);
      }
      result.host = "";
      if (relative._protocol) {
        relative.hostname = "";
        relative._port = -1;
        if (relative.host) {
          if (relPath[0] === "")
            relPath[0] = relative.host;
          else
            relPath.unshift(relative.host);
        }
        relative.host = "";
      }
      mustEndAbs = mustEndAbs && (relPath[0] === "" || srcPath[0] === "");
    }
    if (isRelAbs) {
      result.host = relative.host ? relative.host : result.host;
      result.hostname = relative.hostname ? relative.hostname : result.hostname;
      result.search = relative.search;
      srcPath = relPath;
    } else if (relPath.length) {
      if (!srcPath)
        srcPath = [];
      srcPath.pop();
      srcPath = srcPath.concat(relPath);
      result.search = relative.search;
    } else if (relative.search) {
      if (psychotic) {
        result.hostname = result.host = srcPath.shift();
        var authInHost = result.host && result.host.indexOf("@") > 0 ? result.host.split("@") : false;
        if (authInHost) {
          result.auth = authInHost.shift();
          result.host = result.hostname = authInHost.shift();
        }
      }
      result.search = relative.search;
      result._href = "";
      return result;
    }
    if (!srcPath.length) {
      result.pathname = null;
      result._href = "";
      return result;
    }
    var last = srcPath.slice(-1)[0];
    var hasTrailingSlash = (result.host || relative.host) && (last === "." || last === "..") || last === "";
    var up = 0;
    for (var i2 = srcPath.length; i2 >= 0; i2--) {
      last = srcPath[i2];
      if (last === ".") {
        srcPath.splice(i2, 1);
      } else if (last === "..") {
        srcPath.splice(i2, 1);
        up++;
      } else if (up) {
        srcPath.splice(i2, 1);
        up--;
      }
    }
    if (!mustEndAbs && !removeAllDots) {
      for (; up--; up) {
        srcPath.unshift("..");
      }
    }
    if (mustEndAbs && srcPath[0] !== "" && (!srcPath[0] || srcPath[0].charCodeAt(0) !== 47)) {
      srcPath.unshift("");
    }
    if (hasTrailingSlash && srcPath.join("/").substr(-1) !== "/") {
      srcPath.push("");
    }
    var isAbsolute = srcPath[0] === "" || srcPath[0] && srcPath[0].charCodeAt(0) === 47;
    if (psychotic) {
      result.hostname = result.host = isAbsolute ? "" : srcPath.length ? srcPath.shift() : "";
      var authInHost = result.host && result.host.indexOf("@") > 0 ? result.host.split("@") : false;
      if (authInHost) {
        result.auth = authInHost.shift();
        result.host = result.hostname = authInHost.shift();
      }
    }
    mustEndAbs = mustEndAbs || result.host && srcPath.length;
    if (mustEndAbs && !isAbsolute) {
      srcPath.unshift("");
    }
    result.pathname = srcPath.length === 0 ? null : srcPath.join("/");
    result.auth = relative.auth || result.auth;
    result.slashes = result.slashes || relative.slashes;
    result._href = "";
    return result;
  };
  var punycode2 = requirePunycode();
  Url.prototype._hostIdna = function Url$_hostIdna(hostname2) {
    return punycode2.toASCII(hostname2);
  };
  var escapePathName = Url.prototype._escapePathName = function Url$_escapePathName(pathname) {
    if (!containsCharacter2(
      pathname,
      35,
      63
      /*'?'*/
    )) {
      return pathname;
    }
    return _escapePath(pathname);
  };
  var escapeSearch = Url.prototype._escapeSearch = function Url$_escapeSearch(search) {
    if (!containsCharacter2(search, 35, -1))
      return search;
    return _escapeSearch(search);
  };
  Url.prototype._parseProtocol = function Url$_parseProtocol(str, start, end) {
    var doLowerCase = false;
    var protocolCharacters = this._protocolCharacters;
    for (var i2 = start; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      if (ch === 58) {
        var protocol = str.slice(start, i2);
        if (doLowerCase)
          protocol = protocol.toLowerCase();
        this._protocol = protocol;
        return i2 + 1;
      } else if (protocolCharacters[ch] === 1) {
        if (ch < 97)
          doLowerCase = true;
      } else {
        return start;
      }
    }
    return start;
  };
  Url.prototype._parseAuth = function Url$_parseAuth(str, start, end, decode) {
    var auth = str.slice(start, end + 1);
    if (decode) {
      auth = decodeURIComponent(auth);
    }
    this.auth = auth;
  };
  Url.prototype._parsePort = function Url$_parsePort(str, start, end) {
    var port = 0;
    var hadChars = false;
    var validPort = true;
    for (var i2 = start; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      if (48 <= ch && ch <= 57) {
        port = 10 * port + (ch - 48);
        hadChars = true;
      } else {
        validPort = false;
        if (ch === 92 || ch === 47) {
          validPort = true;
        }
        break;
      }
    }
    if (port === 0 && !hadChars || !validPort) {
      if (!validPort) {
        this._port = -2;
      }
      return 0;
    }
    this._port = port;
    return i2 - start;
  };
  Url.prototype._parseHost = function Url$_parseHost(str, start, end, slashesDenoteHost) {
    var hostEndingCharacters = this._hostEndingCharacters;
    var first = str.charCodeAt(start);
    var second = str.charCodeAt(start + 1);
    if ((first === 47 || first === 92) && (second === 47 || second === 92)) {
      this.slashes = true;
      if (start === 0) {
        if (end < 2)
          return start;
        var hasAuth = containsCharacter(str, 64, 2, hostEndingCharacters);
        if (!hasAuth && !slashesDenoteHost) {
          this.slashes = null;
          return start;
        }
      }
      start += 2;
    } else if (!this._protocol || //2. there was a protocol that requires slashes
    //e.g. in 'http:asd' 'asd' is not a hostname
    slashProtocols[this._protocol]) {
      return start;
    }
    var doLowerCase = false;
    var idna = false;
    var hostNameStart = start;
    var hostNameEnd = end;
    var portLength = 0;
    var charsAfterDot = 0;
    var authNeedsDecoding = false;
    var j = -1;
    for (var i2 = start; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      if (ch === 64) {
        j = i2;
      } else if (ch === 37) {
        authNeedsDecoding = true;
      } else if (hostEndingCharacters[ch] === 1) {
        break;
      }
    }
    if (j > -1) {
      this._parseAuth(str, start, j - 1, authNeedsDecoding);
      start = hostNameStart = j + 1;
    }
    if (str.charCodeAt(start) === 91) {
      for (var i2 = start + 1; i2 <= end; ++i2) {
        var ch = str.charCodeAt(i2);
        if (ch === 93) {
          if (str.charCodeAt(i2 + 1) === 58) {
            portLength = this._parsePort(str, i2 + 2, end) + 1;
          }
          var hostname2 = str.slice(start + 1, i2).toLowerCase();
          this.hostname = hostname2;
          this.host = this._port > 0 ? "[" + hostname2 + "]:" + this._port : "[" + hostname2 + "]";
          this.pathname = "/";
          return i2 + portLength + 1;
        }
      }
      return start;
    }
    for (var i2 = start; i2 <= end; ++i2) {
      if (charsAfterDot > 62) {
        this.hostname = this.host = str.slice(start, i2);
        return i2;
      }
      var ch = str.charCodeAt(i2);
      if (ch === 58) {
        portLength = this._parsePort(str, i2 + 1, end) + 1;
        hostNameEnd = i2 - 1;
        break;
      } else if (ch < 97) {
        if (ch === 46) {
          charsAfterDot = -1;
        } else if (65 <= ch && ch <= 90) {
          doLowerCase = true;
        } else if (!(ch === 45 || ch === 95 || ch === 43 || 48 <= ch && ch <= 57)) {
          if (hostEndingCharacters[ch] === 0 && this._noPrependSlashHostEnders[ch] === 0) {
            this._prependSlash = true;
          }
          hostNameEnd = i2 - 1;
          break;
        }
      } else if (ch >= 123) {
        if (ch <= 126) {
          if (this._noPrependSlashHostEnders[ch] === 0) {
            this._prependSlash = true;
          }
          hostNameEnd = i2 - 1;
          break;
        }
        idna = true;
      }
      charsAfterDot++;
    }
    if (hostNameEnd + 1 !== start && hostNameEnd - hostNameStart <= 256) {
      var hostname2 = str.slice(hostNameStart, hostNameEnd + 1);
      if (doLowerCase)
        hostname2 = hostname2.toLowerCase();
      if (idna)
        hostname2 = this._hostIdna(hostname2);
      this.hostname = hostname2;
      this.host = this._port > 0 ? hostname2 + ":" + this._port : hostname2;
    }
    return hostNameEnd + 1 + portLength;
  };
  Url.prototype._copyPropsTo = function Url$_copyPropsTo(input, noProtocol) {
    if (!noProtocol) {
      input._protocol = this._protocol;
    }
    input._href = this._href;
    input._port = this._port;
    input._prependSlash = this._prependSlash;
    input.auth = this.auth;
    input.slashes = this.slashes;
    input.host = this.host;
    input.hostname = this.hostname;
    input.hash = this.hash;
    input.search = this.search;
    input.pathname = this.pathname;
  };
  Url.prototype._clone = function Url$_clone() {
    var ret = new Url();
    ret._protocol = this._protocol;
    ret._href = this._href;
    ret._port = this._port;
    ret._prependSlash = this._prependSlash;
    ret.auth = this.auth;
    ret.slashes = this.slashes;
    ret.host = this.host;
    ret.hostname = this.hostname;
    ret.hash = this.hash;
    ret.search = this.search;
    ret.pathname = this.pathname;
    return ret;
  };
  Url.prototype._getComponentEscaped = function Url$_getComponentEscaped(str, start, end, isAfterQuery) {
    var cur = start;
    var i2 = start;
    var ret = "";
    var autoEscapeMap2 = isAfterQuery ? this._afterQueryAutoEscapeMap : this._autoEscapeMap;
    for (; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      var escaped = autoEscapeMap2[ch];
      if (escaped !== "" && escaped !== void 0) {
        if (cur < i2)
          ret += str.slice(cur, i2);
        ret += escaped;
        cur = i2 + 1;
      }
    }
    if (cur < i2 + 1)
      ret += str.slice(cur, i2);
    return ret;
  };
  Url.prototype._parsePath = function Url$_parsePath(str, start, end, disableAutoEscapeChars) {
    var pathStart = start;
    var pathEnd = end;
    var escape2 = false;
    var autoEscapeCharacters = this._autoEscapeCharacters;
    var prePath = this._port === -2 ? "/:" : "";
    for (var i2 = start; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      if (ch === 35) {
        this._parseHash(str, i2, end, disableAutoEscapeChars);
        pathEnd = i2 - 1;
        break;
      } else if (ch === 63) {
        this._parseQuery(str, i2, end, disableAutoEscapeChars);
        pathEnd = i2 - 1;
        break;
      } else if (!disableAutoEscapeChars && !escape2 && autoEscapeCharacters[ch] === 1) {
        escape2 = true;
      }
    }
    if (pathStart > pathEnd) {
      this.pathname = prePath === "" ? "/" : prePath;
      return;
    }
    var path;
    if (escape2) {
      path = this._getComponentEscaped(str, pathStart, pathEnd, false);
    } else {
      path = str.slice(pathStart, pathEnd + 1);
    }
    this.pathname = prePath === "" ? this._prependSlash ? "/" + path : path : prePath + path;
  };
  Url.prototype._parseQuery = function Url$_parseQuery(str, start, end, disableAutoEscapeChars) {
    var queryStart = start;
    var queryEnd = end;
    var escape2 = false;
    var autoEscapeCharacters = this._autoEscapeCharacters;
    for (var i2 = start; i2 <= end; ++i2) {
      var ch = str.charCodeAt(i2);
      if (ch === 35) {
        this._parseHash(str, i2, end, disableAutoEscapeChars);
        queryEnd = i2 - 1;
        break;
      } else if (!disableAutoEscapeChars && !escape2 && autoEscapeCharacters[ch] === 1) {
        escape2 = true;
      }
    }
    if (queryStart > queryEnd) {
      this.search = "";
      return;
    }
    var query;
    if (escape2) {
      query = this._getComponentEscaped(str, queryStart, queryEnd, true);
    } else {
      query = str.slice(queryStart, queryEnd + 1);
    }
    this.search = query;
  };
  Url.prototype._parseHash = function Url$_parseHash(str, start, end, disableAutoEscapeChars) {
    if (start > end) {
      this.hash = "";
      return;
    }
    this.hash = disableAutoEscapeChars ? str.slice(start, end + 1) : this._getComponentEscaped(str, start, end, true);
  };
  Object.defineProperty(Url.prototype, "port", {
    get: function() {
      if (this._port >= 0) {
        return "" + this._port;
      }
      return null;
    },
    set: function(v) {
      if (v == null) {
        this._port = -1;
      } else {
        this._port = parseInt(v, 10);
      }
    }
  });
  Object.defineProperty(Url.prototype, "query", {
    get: function() {
      var query = this._query;
      if (query != null) {
        return query;
      }
      var search = this.search;
      if (search) {
        if (search.charCodeAt(0) === 63) {
          search = search.slice(1);
        }
        if (search !== "") {
          this._query = search;
          return search;
        }
      }
      return search;
    },
    set: function(v) {
      this._query = v;
    }
  });
  Object.defineProperty(Url.prototype, "path", {
    get: function() {
      var p = this.pathname || "";
      var s = this.search || "";
      if (p || s) {
        return p + s;
      }
      return p == null && s ? "/" + s : null;
    },
    set: function() {
    }
  });
  Object.defineProperty(Url.prototype, "protocol", {
    get: function() {
      var proto = this._protocol;
      return proto ? proto + ":" : proto;
    },
    set: function(v) {
      if (typeof v === "string") {
        var end = v.length - 1;
        if (v.charCodeAt(end) === 58) {
          this._protocol = v.slice(0, end);
        } else {
          this._protocol = v;
        }
      } else if (v == null) {
        this._protocol = null;
      }
    }
  });
  Object.defineProperty(Url.prototype, "href", {
    get: function() {
      var href = this._href;
      if (!href) {
        href = this._href = this.format();
      }
      return href;
    },
    set: function(v) {
      this._href = v;
    }
  });
  Url.parse = function Url$Parse(str, parseQueryString, hostDenotesSlash, disableAutoEscapeChars) {
    if (str instanceof Url)
      return str;
    var ret = new Url();
    ret.parse(str, !!parseQueryString, !!hostDenotesSlash, !!disableAutoEscapeChars);
    return ret;
  };
  Url.format = function Url$Format(obj) {
    if (typeof obj === "string") {
      obj = Url.parse(obj);
    }
    if (!(obj instanceof Url)) {
      return Url.prototype.format.call(obj);
    }
    return obj.format();
  };
  Url.resolve = function Url$Resolve(source, relative) {
    return Url.parse(source, false, true).resolve(relative);
  };
  Url.resolveObject = function Url$ResolveObject(source, relative) {
    if (!source)
      return relative;
    return Url.parse(source, false, true).resolveObject(relative);
  };
  function _escapePath(pathname) {
    return pathname.replace(/[?#]/g, function(match) {
      return encodeURIComponent(match);
    });
  }
  function _escapeSearch(search) {
    return search.replace(/#/g, function(match) {
      return encodeURIComponent(match);
    });
  }
  function containsCharacter(string, char1, fromIndex, stopCharacterTable) {
    var len2 = string.length;
    for (var i2 = fromIndex; i2 < len2; ++i2) {
      var ch = string.charCodeAt(i2);
      if (ch === char1) {
        return true;
      } else if (stopCharacterTable[ch] === 1) {
        return false;
      }
    }
    return false;
  }
  function containsCharacter2(string, char1, char2) {
    for (var i2 = 0, len2 = string.length; i2 < len2; ++i2) {
      var ch = string.charCodeAt(i2);
      if (ch === char1 || ch === char2)
        return true;
    }
    return false;
  }
  function makeAsciiTable(spec) {
    var ret = new Uint8Array(128);
    spec.forEach(function(item) {
      if (typeof item === "number") {
        ret[item] = 1;
      } else {
        var start = item[0];
        var end = item[1];
        for (var j = start; j <= end; ++j) {
          ret[j] = 1;
        }
      }
    });
    return ret;
  }
  var autoEscape = [
    "<",
    ">",
    '"',
    "`",
    " ",
    "\r",
    "\n",
    "	",
    "{",
    "}",
    "|",
    "\\",
    "^",
    "`",
    "'"
  ];
  var autoEscapeMap = new Array(128);
  for (var i = 0, len = autoEscapeMap.length; i < len; ++i) {
    autoEscapeMap[i] = "";
  }
  for (var i = 0, len = autoEscape.length; i < len; ++i) {
    var c = autoEscape[i];
    var esc = encodeURIComponent(c);
    if (esc === c) {
      esc = escape(c);
    }
    autoEscapeMap[c.charCodeAt(0)] = esc;
  }
  var afterQueryAutoEscapeMap = autoEscapeMap.slice();
  autoEscapeMap[
    92
    /*'\'*/
  ] = "/";
  var slashProtocols = Url.prototype._slashProtocols = {
    http: true,
    https: true,
    gopher: true,
    file: true,
    ftp: true,
    "http:": true,
    "https:": true,
    "gopher:": true,
    "file:": true,
    "ftp:": true
  };
  Url.prototype._protocolCharacters = makeAsciiTable([
    [
      97,
      122
      /*'z'*/
    ],
    [
      65,
      90
      /*'Z'*/
    ],
    46,
    43,
    45
    /*'-'*/
  ]);
  Url.prototype._hostEndingCharacters = makeAsciiTable([
    35,
    63,
    47,
    92
    /*'\'*/
  ]);
  Url.prototype._autoEscapeCharacters = makeAsciiTable(
    autoEscape.map(function(v) {
      return v.charCodeAt(0);
    })
  );
  Url.prototype._noPrependSlashHostEnders = makeAsciiTable(
    [
      "<",
      ">",
      "'",
      "`",
      " ",
      "\r",
      "\n",
      "	",
      "{",
      "}",
      "|",
      "^",
      "`",
      '"',
      "%",
      ";"
    ].map(function(v) {
      return v.charCodeAt(0);
    })
  );
  Url.prototype._autoEscapeMap = autoEscapeMap;
  Url.prototype._afterQueryAutoEscapeMap = afterQueryAutoEscapeMap;
  urlparser = Url;
  Url.replace = function Url$Replace() {
    require.cache.url = {
      exports: Url
    };
  };
  return urlparser;
}
var URLSearchParams$1 = {};
var hasRequiredURLSearchParams;
function requireURLSearchParams() {
  if (hasRequiredURLSearchParams)
    return URLSearchParams$1;
  hasRequiredURLSearchParams = 1;
  Object.defineProperty(URLSearchParams$1, "__esModule", { value: true });
  URLSearchParams$1.PonyfillURLSearchParams = void 0;
  const tslib_1 = require$$0;
  const fast_querystring_1 = tslib_1.__importDefault(requireLib());
  function isURLSearchParams(value) {
    return (value == null ? void 0 : value.entries) != null;
  }
  class PonyfillURLSearchParams {
    constructor(init) {
      if (init) {
        if (typeof init === "string") {
          this.params = fast_querystring_1.default.parse(init);
        } else if (Array.isArray(init)) {
          this.params = {};
          for (const [key, value] of init) {
            this.params[key] = value;
          }
        } else if (isURLSearchParams(init)) {
          this.params = {};
          for (const [key, value] of init.entries()) {
            this.params[key] = value;
          }
        } else {
          this.params = init;
        }
      } else {
        this.params = {};
      }
    }
    append(name, value) {
      const existingValue = this.params[name];
      const finalValue = existingValue ? `${existingValue},${value}` : value;
      this.params[name] = finalValue;
    }
    delete(name) {
      delete this.params[name];
    }
    get(name) {
      const value = this.params[name];
      if (Array.isArray(value)) {
        return value[0] || null;
      }
      return value || null;
    }
    getAll(name) {
      const value = this.params[name];
      if (!Array.isArray(value)) {
        return value ? [value] : [];
      }
      return value;
    }
    has(name) {
      return name in this.params;
    }
    set(name, value) {
      this.params[name] = value;
    }
    sort() {
      const sortedKeys = Object.keys(this.params).sort();
      const sortedParams = {};
      for (const key of sortedKeys) {
        sortedParams[key] = this.params[key];
      }
      this.params = sortedParams;
    }
    toString() {
      return fast_querystring_1.default.stringify(this.params);
    }
    *keys() {
      for (const key in this.params) {
        yield key;
      }
    }
    *entries() {
      for (const key of this.keys()) {
        const value = this.params[key];
        if (Array.isArray(value)) {
          for (const item of value) {
            yield [key, item];
          }
        } else {
          yield [key, value];
        }
      }
    }
    *values() {
      for (const [, value] of this) {
        yield value;
      }
    }
    [Symbol.iterator]() {
      return this.entries();
    }
    forEach(callback) {
      for (const [key, value] of this) {
        callback(value, key, this);
      }
    }
    get size() {
      return Object.keys(this.params).length;
    }
  }
  URLSearchParams$1.PonyfillURLSearchParams = PonyfillURLSearchParams;
  return URLSearchParams$1;
}
var hasRequiredURL;
function requireURL() {
  if (hasRequiredURL)
    return URL$2;
  hasRequiredURL = 1;
  Object.defineProperty(URL$2, "__esModule", { value: true });
  URL$2.PonyfillURL = void 0;
  const tslib_1 = require$$0;
  const fast_querystring_1 = tslib_1.__importDefault(requireLib());
  const fast_url_parser_1 = tslib_1.__importDefault(requireUrlparser());
  const URLSearchParams_js_1 = requireURLSearchParams();
  fast_url_parser_1.default.queryString = fast_querystring_1.default;
  class PonyfillURL extends fast_url_parser_1.default {
    constructor(url, base) {
      super();
      if (url.startsWith("data:")) {
        this.protocol = "data:";
        this.pathname = url.slice("data:".length);
        return;
      }
      this.parse(url, false);
      if (base) {
        const baseParsed = typeof base === "string" ? new PonyfillURL(base) : base;
        this.protocol = this.protocol || baseParsed.protocol;
        this.host = this.host || baseParsed.host;
        this.pathname = this.pathname || baseParsed.pathname;
      }
    }
    get origin() {
      return `${this.protocol}//${this.host}`;
    }
    get searchParams() {
      if (!this._searchParams) {
        this._searchParams = new URLSearchParams_js_1.PonyfillURLSearchParams(this.query);
      }
      return this._searchParams;
    }
    get username() {
      var _a;
      return ((_a = this.auth) == null ? void 0 : _a.split(":")[0]) || "";
    }
    set username(value) {
      this.auth = `${value}:${this.password}`;
    }
    get password() {
      var _a;
      return ((_a = this.auth) == null ? void 0 : _a.split(":")[1]) || "";
    }
    set password(value) {
      this.auth = `${this.username}:${value}`;
    }
    toString() {
      return this.format();
    }
    toJSON() {
      return this.toString();
    }
  }
  URL$2.PonyfillURL = PonyfillURL;
  return URL$2;
}
var hasRequiredFetchNodeHttp;
function requireFetchNodeHttp() {
  if (hasRequiredFetchNodeHttp)
    return fetchNodeHttp;
  hasRequiredFetchNodeHttp = 1;
  Object.defineProperty(fetchNodeHttp, "__esModule", { value: true });
  fetchNodeHttp.fetchNodeHttp = void 0;
  const http_1 = require$$0$3;
  const https_1 = require$$1;
  const stream_1 = require$$0$1;
  const zlib_1 = require$$3;
  const Request_js_1 = requireRequest();
  const Response_js_1 = requireResponse();
  const URL_js_1 = requireURL();
  const utils_js_1 = requireUtils();
  function getRequestFnForProtocol(url) {
    if (url.startsWith("http:")) {
      return http_1.request;
    } else if (url.startsWith("https:")) {
      return https_1.request;
    }
    throw new Error(`Unsupported protocol: ${url.split(":")[0] || url}`);
  }
  function fetchNodeHttp$1(fetchRequest) {
    return new Promise((resolve, reject) => {
      try {
        const requestFn = getRequestFnForProtocol(fetchRequest.url);
        const nodeReadable = fetchRequest.body != null ? (0, utils_js_1.isNodeReadable)(fetchRequest.body) ? fetchRequest.body : stream_1.Readable.from(fetchRequest.body) : null;
        const headersSerializer = fetchRequest.headersSerializer || utils_js_1.getHeadersObj;
        const nodeHeaders = headersSerializer(fetchRequest.headers);
        const nodeRequest = requestFn(fetchRequest.url, {
          method: fetchRequest.method,
          headers: nodeHeaders,
          signal: fetchRequest["_signal"] ?? void 0,
          agent: fetchRequest.agent
        });
        nodeRequest.once("response", (nodeResponse) => {
          let responseBody = nodeResponse;
          const contentEncoding = nodeResponse.headers["content-encoding"];
          switch (contentEncoding) {
            case "x-gzip":
            case "gzip":
              responseBody = nodeResponse.pipe((0, zlib_1.createGunzip)());
              break;
            case "x-deflate":
            case "deflate":
              responseBody = nodeResponse.pipe((0, zlib_1.createInflate)());
              break;
            case "br":
              responseBody = nodeResponse.pipe((0, zlib_1.createBrotliDecompress)());
              break;
          }
          if (nodeResponse.headers.location) {
            if (fetchRequest.redirect === "error") {
              const redirectError = new Error("Redirects are not allowed");
              reject(redirectError);
              nodeResponse.resume();
              return;
            }
            if (fetchRequest.redirect === "follow") {
              const redirectedUrl = new URL_js_1.PonyfillURL(nodeResponse.headers.location, fetchRequest.url);
              const redirectResponse$ = fetchNodeHttp$1(new Request_js_1.PonyfillRequest(redirectedUrl, fetchRequest));
              resolve(redirectResponse$.then((redirectResponse) => {
                redirectResponse.redirected = true;
                return redirectResponse;
              }));
              nodeResponse.resume();
              return;
            }
          }
          const ponyfillResponse = new Response_js_1.PonyfillResponse(responseBody, {
            status: nodeResponse.statusCode,
            statusText: nodeResponse.statusMessage,
            headers: nodeResponse.headers,
            url: fetchRequest.url
          });
          resolve(ponyfillResponse);
        });
        nodeRequest.once("error", reject);
        if (nodeReadable) {
          nodeReadable.pipe(nodeRequest);
        } else {
          nodeRequest.end();
        }
      } catch (e) {
        reject(e);
      }
    });
  }
  fetchNodeHttp.fetchNodeHttp = fetchNodeHttp$1;
  return fetchNodeHttp;
}
var hasRequiredFetch;
function requireFetch() {
  if (hasRequiredFetch)
    return fetch$2;
  hasRequiredFetch = 1;
  Object.defineProperty(fetch$2, "__esModule", { value: true });
  fetch$2.fetchPonyfill = void 0;
  const fs_1 = require$$0$6;
  const url_1 = require$$1$1;
  const fetchCurl_js_1 = requireFetchCurl();
  const fetchNodeHttp_js_1 = requireFetchNodeHttp();
  const Request_js_1 = requireRequest();
  const Response_js_1 = requireResponse();
  const utils_js_1 = requireUtils();
  const BASE64_SUFFIX = ";base64";
  function getResponseForFile(url) {
    const path = (0, url_1.fileURLToPath)(url);
    const readable = (0, fs_1.createReadStream)(path);
    return new Response_js_1.PonyfillResponse(readable);
  }
  function getResponseForDataUri(url) {
    const [mimeType = "text/plain", ...datas] = url.substring(5).split(",");
    const data = decodeURIComponent(datas.join(","));
    if (mimeType.endsWith(BASE64_SUFFIX)) {
      const buffer = Buffer.from(data, "base64url");
      const realMimeType = mimeType.slice(0, -BASE64_SUFFIX.length);
      return new Response_js_1.PonyfillResponse(buffer, {
        status: 200,
        statusText: "OK",
        headers: {
          "content-type": realMimeType
        }
      });
    }
    return new Response_js_1.PonyfillResponse(data, {
      status: 200,
      statusText: "OK",
      headers: {
        "content-type": mimeType
      }
    });
  }
  function isURL(obj) {
    return obj != null && obj.href != null;
  }
  function fetchPonyfill(info, init) {
    if (typeof info === "string" || isURL(info)) {
      const ponyfillRequest = new Request_js_1.PonyfillRequest(info, init);
      return fetchPonyfill(ponyfillRequest);
    }
    const fetchRequest = info;
    if (fetchRequest.url.startsWith("data:")) {
      const response = getResponseForDataUri(fetchRequest.url);
      return (0, utils_js_1.fakePromise)(response);
    }
    if (fetchRequest.url.startsWith("file:")) {
      const response = getResponseForFile(fetchRequest.url);
      return (0, utils_js_1.fakePromise)(response);
    }
    if (globalThis.libcurl) {
      return (0, fetchCurl_js_1.fetchCurl)(fetchRequest);
    }
    return (0, fetchNodeHttp_js_1.fetchNodeHttp)(fetchRequest);
  }
  fetch$2.fetchPonyfill = fetchPonyfill;
  return fetch$2;
}
var TextEncoderDecoder = {};
var hasRequiredTextEncoderDecoder;
function requireTextEncoderDecoder() {
  if (hasRequiredTextEncoderDecoder)
    return TextEncoderDecoder;
  hasRequiredTextEncoderDecoder = 1;
  Object.defineProperty(TextEncoderDecoder, "__esModule", { value: true });
  TextEncoderDecoder.PonyfillBtoa = TextEncoderDecoder.PonyfillTextDecoder = TextEncoderDecoder.PonyfillTextEncoder = void 0;
  const utils_js_1 = requireUtils();
  class PonyfillTextEncoder {
    constructor(encoding = "utf-8") {
      this.encoding = encoding;
    }
    encode(input) {
      return Buffer.from(input, this.encoding);
    }
    encodeInto(source, destination) {
      const buffer = this.encode(source);
      const copied = buffer.copy(destination);
      return {
        read: copied,
        written: copied
      };
    }
  }
  TextEncoderDecoder.PonyfillTextEncoder = PonyfillTextEncoder;
  class PonyfillTextDecoder {
    constructor(encoding = "utf-8", options) {
      this.encoding = encoding;
      this.fatal = false;
      this.ignoreBOM = false;
      if (options) {
        this.fatal = options.fatal || false;
        this.ignoreBOM = options.ignoreBOM || false;
      }
    }
    decode(input) {
      if (Buffer.isBuffer(input)) {
        return input.toString(this.encoding);
      }
      if ((0, utils_js_1.isArrayBufferView)(input)) {
        return Buffer.from(input.buffer, input.byteOffset, input.byteLength).toString(this.encoding);
      }
      return Buffer.from(input).toString(this.encoding);
    }
  }
  TextEncoderDecoder.PonyfillTextDecoder = PonyfillTextDecoder;
  function PonyfillBtoa(input) {
    return Buffer.from(input, "binary").toString("base64");
  }
  TextEncoderDecoder.PonyfillBtoa = PonyfillBtoa;
  return TextEncoderDecoder;
}
var hasRequiredCjs;
function requireCjs() {
  if (hasRequiredCjs)
    return cjs;
  hasRequiredCjs = 1;
  (function(exports) {
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.URLSearchParams = exports.URL = exports.btoa = exports.TextDecoder = exports.TextEncoder = exports.Blob = exports.FormData = exports.File = exports.ReadableStream = exports.Response = exports.Request = exports.Body = exports.Headers = exports.fetch = void 0;
    var fetch_js_1 = requireFetch();
    Object.defineProperty(exports, "fetch", { enumerable: true, get: function() {
      return fetch_js_1.fetchPonyfill;
    } });
    var Headers_js_1 = requireHeaders();
    Object.defineProperty(exports, "Headers", { enumerable: true, get: function() {
      return Headers_js_1.PonyfillHeaders;
    } });
    var Body_js_1 = requireBody();
    Object.defineProperty(exports, "Body", { enumerable: true, get: function() {
      return Body_js_1.PonyfillBody;
    } });
    var Request_js_1 = requireRequest();
    Object.defineProperty(exports, "Request", { enumerable: true, get: function() {
      return Request_js_1.PonyfillRequest;
    } });
    var Response_js_1 = requireResponse();
    Object.defineProperty(exports, "Response", { enumerable: true, get: function() {
      return Response_js_1.PonyfillResponse;
    } });
    var ReadableStream_js_1 = requireReadableStream();
    Object.defineProperty(exports, "ReadableStream", { enumerable: true, get: function() {
      return ReadableStream_js_1.PonyfillReadableStream;
    } });
    var File_js_1 = requireFile();
    Object.defineProperty(exports, "File", { enumerable: true, get: function() {
      return File_js_1.PonyfillFile;
    } });
    var FormData_js_1 = requireFormData();
    Object.defineProperty(exports, "FormData", { enumerable: true, get: function() {
      return FormData_js_1.PonyfillFormData;
    } });
    var Blob_js_1 = requireBlob();
    Object.defineProperty(exports, "Blob", { enumerable: true, get: function() {
      return Blob_js_1.PonyfillBlob;
    } });
    var TextEncoderDecoder_js_1 = requireTextEncoderDecoder();
    Object.defineProperty(exports, "TextEncoder", { enumerable: true, get: function() {
      return TextEncoderDecoder_js_1.PonyfillTextEncoder;
    } });
    Object.defineProperty(exports, "TextDecoder", { enumerable: true, get: function() {
      return TextEncoderDecoder_js_1.PonyfillTextDecoder;
    } });
    Object.defineProperty(exports, "btoa", { enumerable: true, get: function() {
      return TextEncoderDecoder_js_1.PonyfillBtoa;
    } });
    var URL_js_1 = requireURL();
    Object.defineProperty(exports, "URL", { enumerable: true, get: function() {
      return URL_js_1.PonyfillURL;
    } });
    var URLSearchParams_js_1 = requireURLSearchParams();
    Object.defineProperty(exports, "URLSearchParams", { enumerable: true, get: function() {
      return URLSearchParams_js_1.PonyfillURLSearchParams;
    } });
  })(cjs);
  return cjs;
}
const shouldSkipPonyfill$1 = shouldSkipPonyfill$2;
var createNodePonyfill$1 = function createNodePonyfill(opts = {}) {
  const ponyfills2 = {};
  if (!ponyfills2.URLPattern) {
    const urlPatternModule = requireUrlpatternPolyfill();
    ponyfills2.URLPattern = urlPatternModule.URLPattern;
  }
  if (shouldSkipPonyfill$1()) {
    return globalThis;
  }
  const newNodeFetch = requireCjs();
  ponyfills2.fetch = newNodeFetch.fetch;
  ponyfills2.Request = newNodeFetch.Request;
  ponyfills2.Response = newNodeFetch.Response;
  ponyfills2.Headers = newNodeFetch.Headers;
  ponyfills2.FormData = newNodeFetch.FormData;
  ponyfills2.ReadableStream = newNodeFetch.ReadableStream;
  ponyfills2.URL = newNodeFetch.URL;
  ponyfills2.URLSearchParams = newNodeFetch.URLSearchParams;
  ponyfills2.WritableStream = globalThis.WritableStream;
  ponyfills2.TransformStream = globalThis.TransformStream;
  if (!ponyfills2.WritableStream) {
    const streamsWeb = require$$3$1;
    ponyfills2.WritableStream = streamsWeb.WritableStream;
    ponyfills2.TransformStream = streamsWeb.TransformStream;
  }
  ponyfills2.Blob = newNodeFetch.Blob;
  ponyfills2.File = newNodeFetch.File;
  ponyfills2.crypto = globalThis.crypto;
  ponyfills2.btoa = newNodeFetch.btoa;
  ponyfills2.TextEncoder = newNodeFetch.TextEncoder;
  ponyfills2.TextDecoder = newNodeFetch.TextDecoder;
  if (opts.formDataLimits) {
    ponyfills2.Body = class Body extends newNodeFetch.Body {
      constructor(body, userOpts) {
        super(body, {
          formDataLimits: opts.formDataLimits,
          ...userOpts
        });
      }
    };
    ponyfills2.Request = class Request extends newNodeFetch.Request {
      constructor(input, userOpts) {
        super(input, {
          formDataLimits: opts.formDataLimits,
          ...userOpts
        });
      }
    };
    ponyfills2.Response = class Response extends newNodeFetch.Response {
      constructor(body, userOpts) {
        super(body, {
          formDataLimits: opts.formDataLimits,
          ...userOpts
        });
      }
    };
  }
  if (!ponyfills2.crypto) {
    const cryptoModule = require$$4;
    ponyfills2.crypto = cryptoModule.webcrypto;
  }
  return ponyfills2;
};
const createNodePonyfill2 = createNodePonyfill$1;
const shouldSkipPonyfill2 = shouldSkipPonyfill$2;
const ponyfills = createNodePonyfill2();
if (!shouldSkipPonyfill2()) {
  try {
    const nodelibcurlName = "node-libcurl";
    globalThis.libcurl = globalThis.libcurl || commonjsRequire(nodelibcurlName);
  } catch (e) {
  }
}
var fetch$1 = nodePonyfill.fetch = ponyfills.fetch;
var Headers = nodePonyfill.Headers = ponyfills.Headers;
var Request = nodePonyfill.Request = ponyfills.Request;
var Response = nodePonyfill.Response = ponyfills.Response;
var FormData = nodePonyfill.FormData = ponyfills.FormData;
var ReadableStream$1 = nodePonyfill.ReadableStream = ponyfills.ReadableStream;
var WritableStream = nodePonyfill.WritableStream = ponyfills.WritableStream;
var TransformStream = nodePonyfill.TransformStream = ponyfills.TransformStream;
var Blob = nodePonyfill.Blob = ponyfills.Blob;
var File = nodePonyfill.File = ponyfills.File;
var crypto = nodePonyfill.crypto = ponyfills.crypto;
var btoa = nodePonyfill.btoa = ponyfills.btoa;
var TextEncoder = nodePonyfill.TextEncoder = ponyfills.TextEncoder;
var TextDecoder$1 = nodePonyfill.TextDecoder = ponyfills.TextDecoder;
var URLPattern = nodePonyfill.URLPattern = ponyfills.URLPattern;
var URL$1 = nodePonyfill.URL = ponyfills.URL;
var URLSearchParams = nodePonyfill.URLSearchParams = ponyfills.URLSearchParams;
var createFetch = nodePonyfill.createFetch = createNodePonyfill2;
const defaultFetchAPI = /* @__PURE__ */ _mergeNamespaces({
  __proto__: null,
  Blob,
  File,
  FormData,
  Headers,
  ReadableStream: ReadableStream$1,
  Request,
  Response,
  TextDecoder: TextDecoder$1,
  TextEncoder,
  TransformStream,
  URL: URL$1,
  URLPattern,
  URLSearchParams,
  WritableStream,
  btoa,
  createFetch,
  crypto,
  default: nodePonyfill,
  fetch: fetch$1
}, [nodePonyfill]);
function isAsyncIterable(body) {
  return body != null && typeof body === "object" && typeof body[Symbol.asyncIterator] === "function";
}
function getPort(nodeRequest) {
  var _a, _b2, _c2, _d2, _e2;
  if ((_a = nodeRequest.socket) == null ? void 0 : _a.localPort) {
    return (_b2 = nodeRequest.socket) == null ? void 0 : _b2.localPort;
  }
  const hostInHeader = ((_c2 = nodeRequest.headers) == null ? void 0 : _c2[":authority"]) || ((_d2 = nodeRequest.headers) == null ? void 0 : _d2.host);
  const portInHeader = (_e2 = hostInHeader == null ? void 0 : hostInHeader.split(":")) == null ? void 0 : _e2[1];
  if (portInHeader) {
    return portInHeader;
  }
  return 80;
}
function getHostnameWithPort(nodeRequest) {
  var _a, _b2, _c2, _d2, _e2;
  if ((_a = nodeRequest.headers) == null ? void 0 : _a[":authority"]) {
    return (_b2 = nodeRequest.headers) == null ? void 0 : _b2[":authority"];
  }
  if ((_c2 = nodeRequest.headers) == null ? void 0 : _c2.host) {
    return (_d2 = nodeRequest.headers) == null ? void 0 : _d2.host;
  }
  const port = getPort(nodeRequest);
  if (nodeRequest.hostname) {
    return nodeRequest.hostname + ":" + port;
  }
  const localIp = (_e2 = nodeRequest.socket) == null ? void 0 : _e2.localAddress;
  if (localIp && !(localIp == null ? void 0 : localIp.includes("::")) && !(localIp == null ? void 0 : localIp.includes("ffff"))) {
    return `${localIp}:${port}`;
  }
  return "localhost";
}
function buildFullUrl(nodeRequest) {
  var _a;
  const hostnameWithPort = getHostnameWithPort(nodeRequest);
  const protocol = nodeRequest.protocol || (((_a = nodeRequest.socket) == null ? void 0 : _a.encrypted) ? "https" : "http");
  const endpoint = nodeRequest.originalUrl || nodeRequest.url || "/graphql";
  return `${protocol}://${hostnameWithPort}${endpoint}`;
}
function isRequestBody(body) {
  const stringTag = body[Symbol.toStringTag];
  if (typeof body === "string" || stringTag === "Uint8Array" || stringTag === "Blob" || stringTag === "FormData" || stringTag === "URLSearchParams" || isAsyncIterable(body)) {
    return true;
  }
  return false;
}
class ServerAdapterRequestAbortSignal extends EventTarget {
  constructor() {
    super(...arguments);
    this.aborted = false;
    this._onabort = null;
  }
  throwIfAborted() {
    if (this.aborted) {
      throw new DOMException("Aborted", "AbortError");
    }
  }
  sendAbort() {
    this.aborted = true;
    this.dispatchEvent(new Event("abort"));
  }
  get onabort() {
    return this._onabort;
  }
  set onabort(value) {
    this._onabort = value;
    if (value) {
      this.addEventListener("abort", value);
    } else {
      this.removeEventListener("abort", value);
    }
  }
}
let bunNodeCompatModeWarned = false;
function normalizeNodeRequest(nodeRequest, RequestCtor) {
  var _a, _b2, _c2;
  const rawRequest = nodeRequest.raw || nodeRequest.req || nodeRequest;
  let fullUrl = buildFullUrl(rawRequest);
  if (nodeRequest.query) {
    const url = new URL$1(fullUrl);
    for (const key in nodeRequest.query) {
      url.searchParams.set(key, nodeRequest.query[key]);
    }
    fullUrl = url.toString();
  }
  let signal;
  if (RequestCtor !== globalThis.Request) {
    signal = new ServerAdapterRequestAbortSignal();
    if (rawRequest == null ? void 0 : rawRequest.once) {
      rawRequest.once("close", () => {
        if (rawRequest.aborted) {
          signal.sendAbort();
        }
      });
    }
  } else {
    const controller = new AbortController();
    signal = controller.signal;
    if (rawRequest.once) {
      rawRequest.once("close", () => {
        if (rawRequest.aborted) {
          controller.abort();
        }
      });
    }
  }
  if (nodeRequest.method === "GET" || nodeRequest.method === "HEAD") {
    return new RequestCtor(fullUrl, {
      method: nodeRequest.method,
      headers: nodeRequest.headers,
      signal
    });
  }
  const maybeParsedBody = nodeRequest.body;
  if (maybeParsedBody != null && Object.keys(maybeParsedBody).length > 0) {
    if (isRequestBody(maybeParsedBody)) {
      return new RequestCtor(fullUrl, {
        method: nodeRequest.method,
        headers: nodeRequest.headers,
        body: maybeParsedBody,
        signal
      });
    }
    const request = new RequestCtor(fullUrl, {
      method: nodeRequest.method,
      headers: nodeRequest.headers,
      signal
    });
    if (!((_a = request.headers.get("content-type")) == null ? void 0 : _a.includes("json"))) {
      request.headers.set("content-type", "application/json; charset=utf-8");
    }
    return new Proxy(request, {
      get: (target, prop, receiver) => {
        switch (prop) {
          case "json":
            return async () => maybeParsedBody;
          case "text":
            return async () => JSON.stringify(maybeParsedBody);
          default:
            return Reflect.get(target, prop, receiver);
        }
      }
    });
  }
  if (((_c2 = (_b2 = globalThis.process) == null ? void 0 : _b2.versions) == null ? void 0 : _c2.bun) && isReadable(rawRequest)) {
    if (!bunNodeCompatModeWarned) {
      bunNodeCompatModeWarned = true;
      console.warn(`You use Bun Node compatibility mode, which is not recommended!
It will affect your performance. Please check our Bun integration recipe, and avoid using 'node:http' for your server implementation.`);
    }
    return new RequestCtor(fullUrl, {
      method: nodeRequest.method,
      headers: nodeRequest.headers,
      duplex: "half",
      body: new ReadableStream({
        start(controller) {
          rawRequest.on("data", (chunk) => {
            controller.enqueue(chunk);
          });
          rawRequest.on("error", (e) => {
            controller.error(e);
          });
          rawRequest.on("end", () => {
            controller.close();
          });
        },
        cancel(e) {
          rawRequest.destroy(e);
        }
      }),
      signal
    });
  }
  return new RequestCtor(fullUrl, {
    method: nodeRequest.method,
    headers: nodeRequest.headers,
    body: rawRequest,
    duplex: "half",
    signal
  });
}
function isReadable(stream) {
  return stream.read != null;
}
function isNodeRequest(request) {
  return isReadable(request);
}
function isServerResponse(stream) {
  return stream != null && stream.setHeader != null && stream.end != null && stream.once != null && stream.write != null;
}
function isFetchEvent(event) {
  return event != null && event.request != null && event.respondWith != null;
}
function configureSocket(rawRequest) {
  var _a, _b2, _c2, _d2, _e2, _f;
  (_b2 = (_a = rawRequest == null ? void 0 : rawRequest.socket) == null ? void 0 : _a.setTimeout) == null ? void 0 : _b2.call(_a, 0);
  (_d2 = (_c2 = rawRequest == null ? void 0 : rawRequest.socket) == null ? void 0 : _c2.setNoDelay) == null ? void 0 : _d2.call(_c2, true);
  (_f = (_e2 = rawRequest == null ? void 0 : rawRequest.socket) == null ? void 0 : _e2.setKeepAlive) == null ? void 0 : _f.call(_e2, true);
}
function endResponse(serverResponse) {
  serverResponse.end(null, null, null);
}
async function sendAsyncIterable(serverResponse, asyncIterable) {
  for await (const chunk of asyncIterable) {
    if (!serverResponse.write(chunk)) {
      break;
    }
  }
  endResponse(serverResponse);
}
function sendNodeResponse(fetchResponse, serverResponse, nodeRequest) {
  if (serverResponse.closed || serverResponse.destroyed) {
    return;
  }
  if (!fetchResponse) {
    serverResponse.statusCode = 404;
    serverResponse.end();
    return;
  }
  serverResponse.statusCode = fetchResponse.status;
  serverResponse.statusMessage = fetchResponse.statusText;
  let setCookiesSet = false;
  fetchResponse.headers.forEach((value, key) => {
    var _a, _b2;
    if (key === "set-cookie") {
      if (setCookiesSet) {
        return;
      }
      setCookiesSet = true;
      const setCookies = (_b2 = (_a = fetchResponse.headers).getSetCookie) == null ? void 0 : _b2.call(_a);
      if (setCookies) {
        serverResponse.setHeader("set-cookie", setCookies);
        return;
      }
    }
    serverResponse.setHeader(key, value);
  });
  const bufOfRes = fetchResponse._buffer;
  if (bufOfRes) {
    serverResponse.write(bufOfRes);
    endResponse(serverResponse);
    return;
  }
  const fetchBody = fetchResponse.body;
  if (fetchBody == null) {
    endResponse(serverResponse);
    return;
  }
  if (fetchBody[Symbol.toStringTag] === "Uint8Array") {
    serverResponse.write(fetchBody);
    endResponse(serverResponse);
    return;
  }
  configureSocket(nodeRequest);
  if (isReadable(fetchBody)) {
    serverResponse.once("close", () => {
      fetchBody.destroy();
    });
    fetchBody.pipe(serverResponse);
    return;
  }
  if (isAsyncIterable(fetchBody)) {
    return sendAsyncIterable(serverResponse, fetchBody);
  }
}
function isRequestInit(val) {
  return val != null && typeof val === "object" && ("body" in val || "cache" in val || "credentials" in val || "headers" in val || "integrity" in val || "keepalive" in val || "method" in val || "mode" in val || "redirect" in val || "referrer" in val || "referrerPolicy" in val || "signal" in val || "window" in val);
}
function completeAssign(...args) {
  const [target, ...sources] = args.filter((arg) => arg != null && typeof arg === "object");
  sources.forEach((source) => {
    const descriptors = Object.getOwnPropertyNames(source).reduce((descriptors2, key) => {
      descriptors2[key] = Object.getOwnPropertyDescriptor(source, key);
      return descriptors2;
    }, {});
    Object.getOwnPropertySymbols(source).forEach((sym) => {
      const descriptor = Object.getOwnPropertyDescriptor(source, sym);
      if (descriptor.enumerable) {
        descriptors[sym] = descriptor;
      }
    });
    Object.defineProperties(target, descriptors);
  });
  return target;
}
function isPromise(val) {
  return (val == null ? void 0 : val.then) != null;
}
function iterateAsyncVoid(iterable, callback) {
  const iterator = iterable[Symbol.iterator]();
  let stopEarlyFlag = false;
  function stopEarlyFn() {
    stopEarlyFlag = true;
  }
  function iterate() {
    const { done: endOfIterator, value } = iterator.next();
    if (endOfIterator) {
      return;
    }
    const result$ = callback(value, stopEarlyFn);
    if (isPromise(result$)) {
      return result$.then(() => {
        if (stopEarlyFlag) {
          return;
        }
        return iterate();
      });
    }
    if (stopEarlyFlag) {
      return;
    }
    return iterate();
  }
  return iterate();
}
function handleErrorFromRequestHandler(error, ResponseCtor) {
  return new ResponseCtor(error.stack || error.message || error.toString(), {
    status: error.status || 500
  });
}
function isolateObject(originalCtx, waitUntilPromises) {
  if (originalCtx == null) {
    return {};
  }
  const extraProps = {};
  const deletedProps = /* @__PURE__ */ new Set();
  return new Proxy(originalCtx, {
    get(originalCtx2, prop) {
      if (waitUntilPromises != null && prop === "waitUntil") {
        return function waitUntil(promise) {
          waitUntilPromises.push(promise.catch((err) => console.error(err)));
        };
      }
      const extraPropVal = extraProps[prop];
      if (extraPropVal != null) {
        if (typeof extraPropVal === "function") {
          return extraPropVal.bind(extraProps);
        }
        return extraPropVal;
      }
      if (deletedProps.has(prop)) {
        return void 0;
      }
      return originalCtx2[prop];
    },
    set(_originalCtx, prop, value) {
      extraProps[prop] = value;
      return true;
    },
    has(originalCtx2, prop) {
      if (waitUntilPromises != null && prop === "waitUntil") {
        return true;
      }
      if (deletedProps.has(prop)) {
        return false;
      }
      if (prop in extraProps) {
        return true;
      }
      return prop in originalCtx2;
    },
    defineProperty(_originalCtx, prop, descriptor) {
      return Reflect.defineProperty(extraProps, prop, descriptor);
    },
    deleteProperty(_originalCtx, prop) {
      if (prop in extraProps) {
        return Reflect.deleteProperty(extraProps, prop);
      }
      deletedProps.add(prop);
      return true;
    },
    ownKeys(originalCtx2) {
      const extraKeys = Reflect.ownKeys(extraProps);
      const originalKeys = Reflect.ownKeys(originalCtx2);
      const deletedKeys = Array.from(deletedProps);
      const allKeys = new Set(extraKeys.concat(originalKeys.filter((keys) => !deletedKeys.includes(keys))));
      if (waitUntilPromises != null) {
        allKeys.add("waitUntil");
      }
      return Array.from(allKeys);
    },
    getOwnPropertyDescriptor(originalCtx2, prop) {
      if (prop in extraProps) {
        return Reflect.getOwnPropertyDescriptor(extraProps, prop);
      }
      if (deletedProps.has(prop)) {
        return void 0;
      }
      return Reflect.getOwnPropertyDescriptor(originalCtx2, prop);
    }
  });
}
function isUWSResponse(res) {
  return !!res.onData;
}
function getRequestFromUWSRequest({ req, res, fetchAPI }) {
  let body;
  const method = req.getMethod();
  if (method !== "get" && method !== "head") {
    body = new fetchAPI.ReadableStream({});
    const readable = body.readable;
    res.onAborted(() => {
      readable.push(null);
    });
    let multipleChunks = false;
    res.onData(function(ab, isLast) {
      const chunk = Buffer.from(ab, 0, ab.byteLength);
      if (!multipleChunks && isLast) {
        readable.push(chunk);
      } else {
        readable.push(Buffer.from(chunk));
      }
      if (isLast) {
        readable.push(null);
      }
      multipleChunks = true;
    });
  }
  const headers = new fetchAPI.Headers();
  req.forEach((key, value) => {
    headers.set(key, value);
  });
  let url = `http://localhost${req.getUrl()}`;
  const query = req.getQuery();
  if (query) {
    url += `?${query}`;
  }
  return new fetchAPI.Request(url, {
    method,
    headers,
    body,
    signal: new ServerAdapterRequestAbortSignal()
  });
}
async function forwardResponseBodyToUWSResponse(uwsResponse, fetchResponse) {
  let resAborted = false;
  uwsResponse.onAborted(function() {
    resAborted = true;
  });
  for await (const chunk of fetchResponse.body) {
    if (resAborted) {
      return;
    }
    uwsResponse.cork(() => {
      uwsResponse.write(chunk);
    });
  }
  uwsResponse.cork(() => {
    uwsResponse.end();
  });
}
function sendResponseToUwsOpts(uwsResponse, fetchResponse) {
  if (!fetchResponse) {
    uwsResponse.writeStatus("404 Not Found");
    uwsResponse.end();
    return;
  }
  const bufferOfRes = fetchResponse._buffer;
  uwsResponse.cork(() => {
    var _a, _b2;
    uwsResponse.writeStatus(`${fetchResponse.status} ${fetchResponse.statusText}`);
    for (const [key, value] of fetchResponse.headers) {
      if (key !== "content-length") {
        if (key === "set-cookie") {
          const setCookies = (_b2 = (_a = fetchResponse.headers).getSetCookie) == null ? void 0 : _b2.call(_a);
          if (setCookies) {
            for (const setCookie of setCookies) {
              uwsResponse.writeHeader(key, setCookie);
            }
            continue;
          }
        }
        uwsResponse.writeHeader(key, value);
      }
    }
    if (bufferOfRes) {
      uwsResponse.end(bufferOfRes);
    }
  });
  if (bufferOfRes) {
    return;
  }
  if (!fetchResponse.body) {
    uwsResponse.end();
    return;
  }
  return forwardResponseBodyToUWSResponse(uwsResponse, fetchResponse);
}
async function handleWaitUntils(waitUntilPromises) {
  await Promise.allSettled(waitUntilPromises);
}
function isRequestAccessible(serverContext) {
  try {
    return !!(serverContext == null ? void 0 : serverContext.request);
  } catch {
    return false;
  }
}
const EMPTY_OBJECT = {};
function createServerAdapter(serverAdapterBaseObject, options) {
  const fetchAPI = {
    ...defaultFetchAPI,
    ...options == null ? void 0 : options.fetchAPI
  };
  const givenHandleRequest = typeof serverAdapterBaseObject === "function" ? serverAdapterBaseObject : serverAdapterBaseObject.handle;
  const onRequestHooks = [];
  const onResponseHooks = [];
  if ((options == null ? void 0 : options.plugins) != null) {
    for (const plugin of options.plugins) {
      if (plugin.onRequest) {
        onRequestHooks.push(plugin.onRequest);
      }
      if (plugin.onResponse) {
        onResponseHooks.push(plugin.onResponse);
      }
    }
  }
  const handleRequest = onRequestHooks.length > 0 || onResponseHooks.length > 0 ? function handleRequest2(request, serverContext) {
    let requestHandler = givenHandleRequest;
    let response;
    if (onRequestHooks.length === 0) {
      return handleEarlyResponse();
    }
    let url = new Proxy(EMPTY_OBJECT, {
      get(_target, prop, _receiver) {
        url = new fetchAPI.URL(request.url, "http://localhost");
        return Reflect.get(url, prop, url);
      }
    });
    const onRequestHooksIteration$ = iterateAsyncVoid(onRequestHooks, (onRequestHook, stopEarly) => onRequestHook({
      request,
      serverContext,
      fetchAPI,
      url,
      requestHandler,
      setRequestHandler(newRequestHandler) {
        requestHandler = newRequestHandler;
      },
      endResponse(newResponse) {
        response = newResponse;
        if (newResponse) {
          stopEarly();
        }
      }
    }));
    function handleResponse(response2) {
      if (onRequestHooks.length === 0) {
        return response2;
      }
      const onResponseHookPayload = {
        request,
        response: response2,
        serverContext
      };
      const onResponseHooksIteration$ = iterateAsyncVoid(onResponseHooks, (onResponseHook) => onResponseHook(onResponseHookPayload));
      if (isPromise(onResponseHooksIteration$)) {
        return onResponseHooksIteration$.then(() => response2);
      }
      return response2;
    }
    function handleEarlyResponse() {
      if (!response) {
        const response$ = requestHandler(request, serverContext);
        if (isPromise(response$)) {
          return response$.then(handleResponse);
        }
        return handleResponse(response$);
      }
      return handleResponse(response);
    }
    if (isPromise(onRequestHooksIteration$)) {
      return onRequestHooksIteration$.then(handleEarlyResponse);
    }
    return handleEarlyResponse();
  } : givenHandleRequest;
  function handleNodeRequest(nodeRequest, ...ctx) {
    const serverContext = ctx.length > 1 ? completeAssign(...ctx) : ctx[0] || {};
    const request = normalizeNodeRequest(nodeRequest, fetchAPI.Request);
    return handleRequest(request, serverContext);
  }
  function requestListener(nodeRequest, serverResponse, ...ctx) {
    const waitUntilPromises = [];
    const defaultServerContext = {
      req: nodeRequest,
      res: serverResponse,
      waitUntil(cb) {
        waitUntilPromises.push(cb.catch((err) => console.error(err)));
      }
    };
    let response$;
    try {
      response$ = handleNodeRequest(nodeRequest, defaultServerContext, ...ctx);
    } catch (err) {
      response$ = handleErrorFromRequestHandler(err, fetchAPI.Response);
    }
    if (isPromise(response$)) {
      return response$.catch((e) => handleErrorFromRequestHandler(e, fetchAPI.Response)).then((response) => sendNodeResponse(response, serverResponse, nodeRequest)).catch((err) => {
        console.error(`Unexpected error while handling request: ${err.message || err}`);
      });
    }
    try {
      return sendNodeResponse(response$, serverResponse, nodeRequest);
    } catch (err) {
      console.error(`Unexpected error while handling request: ${err.message || err}`);
    }
  }
  function handleUWS(res, req, ...ctx) {
    const waitUntilPromises = [];
    const defaultServerContext = {
      res,
      req,
      waitUntil(cb) {
        waitUntilPromises.push(cb.catch((err) => console.error(err)));
      }
    };
    const filteredCtxParts = ctx.filter((partCtx) => partCtx != null);
    const serverContext = filteredCtxParts.length > 0 ? completeAssign(defaultServerContext, ...ctx) : defaultServerContext;
    const request = getRequestFromUWSRequest({
      req,
      res,
      fetchAPI
    });
    let resAborted = false;
    res.onAborted(() => {
      resAborted = true;
      request.signal.sendAbort();
    });
    let response$;
    try {
      response$ = handleRequest(request, serverContext);
    } catch (err) {
      response$ = handleErrorFromRequestHandler(err, fetchAPI.Response);
    }
    if (isPromise(response$)) {
      return response$.catch((e) => handleErrorFromRequestHandler(e, fetchAPI.Response)).then((response) => {
        if (!resAborted) {
          return sendResponseToUwsOpts(res, response);
        }
      }).catch((err) => {
        console.error(`Unexpected error while handling request: ${err.message || err}`);
      });
    }
    try {
      return sendResponseToUwsOpts(res, response$);
    } catch (err) {
      console.error(`Unexpected error while handling request: ${err.message || err}`);
    }
  }
  function handleEvent(event, ...ctx) {
    if (!event.respondWith || !event.request) {
      throw new TypeError(`Expected FetchEvent, got ${event}`);
    }
    const filteredCtxParts = ctx.filter((partCtx) => partCtx != null);
    const serverContext = filteredCtxParts.length > 0 ? completeAssign({}, event, ...filteredCtxParts) : isolateObject(event);
    const response$ = handleRequest(event.request, serverContext);
    event.respondWith(response$);
  }
  function handleRequestWithWaitUntil(request, ...ctx) {
    const filteredCtxParts = ctx.filter((partCtx) => partCtx != null);
    let waitUntilPromises;
    const serverContext = filteredCtxParts.length > 1 ? completeAssign(...filteredCtxParts) : isolateObject(filteredCtxParts[0], filteredCtxParts[0] == null || filteredCtxParts[0].waitUntil == null ? waitUntilPromises = [] : void 0);
    const response$ = handleRequest(request, serverContext);
    if (waitUntilPromises == null ? void 0 : waitUntilPromises.length) {
      return handleWaitUntils(waitUntilPromises).then(() => response$);
    }
    return response$;
  }
  const fetchFn = (input, ...maybeCtx) => {
    if (typeof input === "string" || "href" in input) {
      const [initOrCtx, ...restOfCtx] = maybeCtx;
      if (isRequestInit(initOrCtx)) {
        return handleRequestWithWaitUntil(new fetchAPI.Request(input, initOrCtx), ...restOfCtx);
      }
      return handleRequestWithWaitUntil(new fetchAPI.Request(input), ...maybeCtx);
    }
    return handleRequestWithWaitUntil(input, ...maybeCtx);
  };
  const genericRequestHandler = (input, ...maybeCtx) => {
    const [initOrCtxOrRes, ...restOfCtx] = maybeCtx;
    if (isNodeRequest(input)) {
      if (!isServerResponse(initOrCtxOrRes)) {
        throw new TypeError(`Expected ServerResponse, got ${initOrCtxOrRes}`);
      }
      return requestListener(input, initOrCtxOrRes, ...restOfCtx);
    }
    if (isUWSResponse(input)) {
      return handleUWS(input, initOrCtxOrRes, ...restOfCtx);
    }
    if (isServerResponse(initOrCtxOrRes)) {
      throw new TypeError("Got Node response without Node request");
    }
    if (isRequestAccessible(input)) {
      if (isFetchEvent(input)) {
        return handleEvent(input, ...maybeCtx);
      }
      return handleRequestWithWaitUntil(input.request, input, ...maybeCtx);
    }
    return fetchFn(input, ...maybeCtx);
  };
  const adapterObj = {
    handleRequest,
    fetch: fetchFn,
    handleNodeRequest,
    requestListener,
    handleEvent,
    handleUWS,
    handle: genericRequestHandler
  };
  const serverAdapter = new Proxy(genericRequestHandler, {
    // It should have all the attributes of the handler function and the server instance
    has: (_, prop) => {
      return prop in adapterObj || prop in genericRequestHandler || serverAdapterBaseObject && prop in serverAdapterBaseObject;
    },
    get: (_, prop) => {
      const adapterProp = adapterObj[prop];
      if (adapterProp) {
        if (adapterProp.bind) {
          return adapterProp.bind(adapterObj);
        }
        return adapterProp;
      }
      const handleProp = genericRequestHandler[prop];
      if (handleProp) {
        if (handleProp.bind) {
          return handleProp.bind(genericRequestHandler);
        }
        return handleProp;
      }
      if (serverAdapterBaseObject) {
        const serverAdapterBaseObjectProp = serverAdapterBaseObject[prop];
        if (serverAdapterBaseObjectProp) {
          if (serverAdapterBaseObjectProp.bind) {
            return function(...args) {
              const returnedVal = serverAdapterBaseObject[prop](...args);
              if (returnedVal === serverAdapterBaseObject) {
                return serverAdapter;
              }
              return returnedVal;
            };
          }
          return serverAdapterBaseObjectProp;
        }
      }
    },
    apply(_, __, args) {
      return genericRequestHandler(...args);
    }
  });
  return serverAdapter;
}
function getCORSHeadersByRequestAndOptions(request, corsOptions) {
  var _a, _b2;
  const currentOrigin = request.headers.get("origin");
  if (corsOptions === false || currentOrigin == null) {
    return null;
  }
  const headers = {};
  if (corsOptions.origin == null || corsOptions.origin.length === 0 || corsOptions.origin.includes("*")) {
    headers["Access-Control-Allow-Origin"] = currentOrigin;
    headers["Vary"] = "Origin";
  } else if (typeof corsOptions.origin === "string") {
    headers["Access-Control-Allow-Origin"] = corsOptions.origin;
  } else if (Array.isArray(corsOptions.origin)) {
    if (corsOptions.origin.length === 1) {
      headers["Access-Control-Allow-Origin"] = corsOptions.origin[0];
    } else if (corsOptions.origin.includes(currentOrigin)) {
      headers["Access-Control-Allow-Origin"] = currentOrigin;
      headers["Vary"] = "Origin";
    } else {
      headers["Access-Control-Allow-Origin"] = "null";
    }
  }
  if ((_a = corsOptions.methods) == null ? void 0 : _a.length) {
    headers["Access-Control-Allow-Methods"] = corsOptions.methods.join(", ");
  } else {
    const requestMethod = request.headers.get("access-control-request-method");
    if (requestMethod) {
      headers["Access-Control-Allow-Methods"] = requestMethod;
    }
  }
  if ((_b2 = corsOptions.allowedHeaders) == null ? void 0 : _b2.length) {
    headers["Access-Control-Allow-Headers"] = corsOptions.allowedHeaders.join(", ");
  } else {
    const requestHeaders = request.headers.get("access-control-request-headers");
    if (requestHeaders) {
      headers["Access-Control-Allow-Headers"] = requestHeaders;
      if (headers["Vary"]) {
        headers["Vary"] += ", Access-Control-Request-Headers";
      }
      headers["Vary"] = "Access-Control-Request-Headers";
    }
  }
  if (corsOptions.credentials != null) {
    if (corsOptions.credentials === true) {
      headers["Access-Control-Allow-Credentials"] = "true";
    }
  } else if (headers["Access-Control-Allow-Origin"] !== "*") {
    headers["Access-Control-Allow-Credentials"] = "true";
  }
  if (corsOptions.exposedHeaders) {
    headers["Access-Control-Expose-Headers"] = corsOptions.exposedHeaders.join(", ");
  }
  if (corsOptions.maxAge) {
    headers["Access-Control-Max-Age"] = corsOptions.maxAge.toString();
  }
  return headers;
}
async function getCORSResponseHeaders(request, corsOptionsFactory, serverContext) {
  const corsOptions = await corsOptionsFactory(request, serverContext);
  return getCORSHeadersByRequestAndOptions(request, corsOptions);
}
function useCORS(options) {
  let corsOptionsFactory = () => ({});
  if (options != null) {
    if (typeof options === "function") {
      corsOptionsFactory = options;
    } else if (typeof options === "object") {
      const corsOptions = {
        ...options
      };
      corsOptionsFactory = () => corsOptions;
    } else if (options === false) {
      corsOptionsFactory = () => false;
    }
  }
  return {
    onRequest({ request, fetchAPI, endResponse: endResponse2 }) {
      if (request.method.toUpperCase() === "OPTIONS") {
        const response = new fetchAPI.Response(null, {
          status: 204,
          // Safari (and potentially other browsers) need content-length 0,
          // for 204 or they just hang waiting for a body
          // see: https://github.com/expressjs/cors/blob/master/lib/index.js#L176
          headers: {
            "Content-Length": "0"
          }
        });
        endResponse2(response);
      }
    },
    async onResponse({ request, serverContext, response }) {
      const headers = await getCORSResponseHeaders(request, corsOptionsFactory, serverContext);
      if (headers != null) {
        for (const headerName in headers) {
          response.headers.set(headerName, headers[headerName]);
        }
      }
    }
  };
}
function createDefaultErrorHandler(ResponseCtor = Response) {
  return function defaultErrorHandler(e) {
    if (e.details || e.status || e.headers || e.name === "HTTPError") {
      return new ResponseCtor(typeof e.details === "object" ? JSON.stringify(e.details) : e.message, {
        status: e.status,
        headers: e.headers || {}
      });
    }
    console.error(e);
    if (ResponseCtor.error) {
      return ResponseCtor.error();
    }
    return new ResponseCtor(null, { status: 500 });
  };
}
function useErrorHandling(onError) {
  return {
    onRequest({ requestHandler, setRequestHandler, fetchAPI }) {
      const errorHandler = onError || createDefaultErrorHandler(fetchAPI.Response);
      setRequestHandler(function handlerWithErrorHandling(request, serverContext) {
        try {
          const response$ = requestHandler(request, serverContext);
          if (isPromise(response$)) {
            return response$.catch((e) => errorHandler(e, request, serverContext));
          }
          return response$;
        } catch (e) {
          return errorHandler(e, request, serverContext);
        }
      });
    }
  };
}
function handleURLSearchParams(searchParams) {
  const operationName = searchParams.get("operationName") || void 0;
  const query = searchParams.get("query") || void 0;
  const variablesStr = searchParams.get("variables") || void 0;
  const extensionsStr = searchParams.get("extensions") || void 0;
  return {
    operationName,
    query,
    variables: variablesStr ? JSON.parse(variablesStr) : void 0,
    extensions: extensionsStr ? JSON.parse(extensionsStr) : void 0
  };
}
function parseURLSearchParams(requestBody) {
  const searchParams = new URLSearchParams(requestBody);
  return handleURLSearchParams(searchParams);
}
function isContentTypeMatch(request, expectedContentType) {
  let contentType = request.headers.get("content-type");
  contentType = (contentType == null ? void 0 : contentType.split(",")[0]) || null;
  return contentType === expectedContentType || !!(contentType == null ? void 0 : contentType.startsWith(`${expectedContentType};`));
}
function isGETRequest(request) {
  return request.method === "GET";
}
function parseGETRequest(request) {
  const [, queryString = ""] = request.url.split("?");
  const searchParams = new URLSearchParams(queryString);
  return handleURLSearchParams(searchParams);
}
function isPOSTFormUrlEncodedRequest(request) {
  return request.method === "POST" && isContentTypeMatch(request, "application/x-www-form-urlencoded");
}
async function parsePOSTFormUrlEncodedRequest(request) {
  const requestBody = await request.text();
  return parseURLSearchParams(requestBody);
}
function isPOSTGraphQLStringRequest(request) {
  return request.method === "POST" && isContentTypeMatch(request, "application/graphql");
}
async function parsePOSTGraphQLStringRequest(request) {
  const requestBody = await request.text();
  return {
    query: requestBody
  };
}
function isPOSTJsonRequest(request) {
  return request.method === "POST" && (isContentTypeMatch(request, "application/json") || isContentTypeMatch(request, "application/graphql+json"));
}
async function parsePOSTJsonRequest(request) {
  let requestBody;
  try {
    requestBody = await request.json();
  } catch (err) {
    const extensions = {
      http: {
        spec: true,
        status: 400
      }
    };
    if (err instanceof Error) {
      extensions.originalError = {
        name: err.name,
        message: err.message
      };
    }
    throw createGraphQLError("POST body sent invalid JSON.", {
      extensions
    });
  }
  if (requestBody == null) {
    throw createGraphQLError(`POST body is expected to be object but received ${requestBody}`, {
      extensions: {
        http: {
          status: 400
        }
      }
    });
  }
  const requestBodyTypeof = typeof requestBody;
  if (requestBodyTypeof !== "object") {
    throw createGraphQLError(`POST body is expected to be object but received ${requestBodyTypeof}`, {
      extensions: {
        http: {
          status: 400
        }
      }
    });
  }
  return requestBody;
}
function dset(obj, keys, val) {
  keys.split && (keys = keys.split("."));
  var i = 0, l = keys.length, t = obj, x, k;
  while (i < l) {
    k = keys[i++];
    if (k === "__proto__" || k === "constructor" || k === "prototype")
      break;
    t = t[k] = i === l ? val : typeof (x = t[k]) === typeof keys ? x : keys[i] * 0 !== 0 || !!~("" + keys[i]).indexOf(".") ? {} : [];
  }
}
function isPOSTMultipartRequest(request) {
  return request.method === "POST" && isContentTypeMatch(request, "multipart/form-data");
}
async function parsePOSTMultipartRequest(request) {
  let requestBody;
  try {
    requestBody = await request.formData();
  } catch (e) {
    if (e instanceof Error && e.message.startsWith("File size limit exceeded: ")) {
      throw createGraphQLError(e.message, {
        extensions: {
          http: {
            status: 413
          }
        }
      });
    }
    throw e;
  }
  const operationsStr = requestBody.get("operations");
  if (!operationsStr) {
    throw createGraphQLError('Missing multipart form field "operations"');
  }
  if (typeof operationsStr !== "string") {
    throw createGraphQLError('Multipart form field "operations" must be a string');
  }
  let operations;
  try {
    operations = JSON.parse(operationsStr);
  } catch (err) {
    throw createGraphQLError('Multipart form field "operations" must be a valid JSON string');
  }
  const mapStr = requestBody.get("map");
  if (mapStr != null) {
    if (typeof mapStr !== "string") {
      throw createGraphQLError('Multipart form field "map" must be a string');
    }
    let map;
    try {
      map = JSON.parse(mapStr);
    } catch (err) {
      throw createGraphQLError('Multipart form field "map" must be a valid JSON string');
    }
    for (const fileIndex in map) {
      const file = requestBody.get(fileIndex);
      const keys = map[fileIndex];
      for (const key of keys) {
        dset(operations, key, file);
      }
    }
  }
  return operations;
}
const expectedParameters = /* @__PURE__ */ new Set(["query", "variables", "operationName", "extensions"]);
function assertInvalidParams(params) {
  if (params == null || typeof params !== "object") {
    throw createGraphQLError('Invalid "params" in the request body', {
      extensions: {
        http: {
          spec: true,
          status: 400
        }
      }
    });
  }
  for (const paramKey in params) {
    if (params[paramKey] == null) {
      continue;
    }
    if (!expectedParameters.has(paramKey)) {
      throw createGraphQLError(`Unexpected parameter "${paramKey}" in the request body.`, {
        extensions: {
          http: {
            status: 400
          }
        }
      });
    }
  }
}
function checkGraphQLQueryParams(params) {
  if (!isObject(params)) {
    throw createGraphQLError(`Expected params to be an object but given ${extendedTypeof(params)}.`, {
      extensions: {
        http: {
          status: 400,
          headers: {
            Allow: "GET, POST"
          }
        }
      }
    });
  }
  assertInvalidParams(params);
  if (params.query == null) {
    throw createGraphQLError("Must provide query string.", {
      extensions: {
        http: {
          spec: true,
          status: 400,
          headers: {
            Allow: "GET, POST"
          }
        }
      }
    });
  }
  const queryType = extendedTypeof(params.query);
  if (queryType !== "string") {
    throw createGraphQLError(`Expected "query" param to be a string, but given ${queryType}.`, {
      extensions: {
        http: {
          status: 400,
          headers: {
            Allow: "GET, POST"
          }
        }
      }
    });
  }
  const variablesParamType = extendedTypeof(params.variables);
  if (!["object", "null", "undefined"].includes(variablesParamType)) {
    throw createGraphQLError(`Expected "variables" param to be empty or an object, but given ${variablesParamType}.`, {
      extensions: {
        http: {
          status: 400,
          headers: {
            Allow: "GET, POST"
          }
        }
      }
    });
  }
  const extensionsParamType = extendedTypeof(params.extensions);
  if (!["object", "null", "undefined"].includes(extensionsParamType)) {
    throw createGraphQLError(`Expected "extensions" param to be empty or an object, but given ${extensionsParamType}.`, {
      extensions: {
        http: {
          status: 400,
          headers: {
            Allow: "GET, POST"
          }
        }
      }
    });
  }
  return params;
}
function useCheckGraphQLQueryParams() {
  return {
    onParams({ params }) {
      checkGraphQLQueryParams(params);
    }
  };
}
function extendedTypeof(val) {
  if (val === null) {
    return "null";
  }
  if (Array.isArray(val)) {
    return "array";
  }
  return typeof val;
}
function isObject(val) {
  return extendedTypeof(val) === "object";
}
function isValidMethodForGraphQL(method) {
  return method === "GET" || method === "POST";
}
function useCheckMethodForGraphQL() {
  return {
    onRequestParse({ request }) {
      if (!isValidMethodForGraphQL(request.method)) {
        throw createGraphQLError("GraphQL only supports GET and POST requests.", {
          extensions: {
            http: {
              status: 405,
              headers: {
                Allow: "GET, POST"
              }
            }
          }
        });
      }
    }
  };
}
function useHTTPValidationError() {
  return {
    onValidate() {
      return ({ valid, result }) => {
        var _a, _b2;
        if (!valid) {
          for (const error of result) {
            error.extensions.http = {
              ...error.extensions.http,
              spec: ((_a = error.extensions.http) == null ? void 0 : _a.spec) ?? true,
              status: ((_b2 = error.extensions.http) == null ? void 0 : _b2.status) ?? 400
            };
          }
        }
      };
    }
  };
}
function useLimitBatching(limit) {
  return {
    onRequestParse() {
      return {
        onRequestParseDone({ requestParserResult }) {
          if (Array.isArray(requestParserResult)) {
            if (!limit) {
              throw createGraphQLError(`Batching is not supported.`, {
                extensions: {
                  http: {
                    status: 400
                  }
                }
              });
            }
            if (requestParserResult.length > limit) {
              throw createGraphQLError(`Batching is limited to ${limit} operations per request.`, {
                extensions: {
                  http: {
                    status: 413
                  }
                }
              });
            }
          }
        }
      };
    }
  };
}
function assertMutationViaGet(method, document, operationName) {
  const operation = document ? getOperationAST(document, operationName) ?? void 0 : void 0;
  if (!operation) {
    throw createGraphQLError("Could not determine what operation to execute.", {
      extensions: {
        http: {
          status: 400
        }
      }
    });
  }
  if (operation.operation === "mutation" && method === "GET") {
    throw createGraphQLError("Can only perform a mutation operation from a POST request.", {
      extensions: {
        http: {
          status: 405,
          headers: {
            Allow: "POST"
          }
        }
      }
    });
  }
}
function usePreventMutationViaGET() {
  return {
    onParse() {
      return ({ result, context: {
        request,
        // the `params` might be missing in cases where the user provided
        // malformed context to getEnveloped (like `yoga.getEnveloped({})`)
        params: { operationName } = {}
      } }) => {
        if (!request) {
          return;
        }
        if (result instanceof Error) {
          if (result instanceof GraphQLError) {
            result.extensions.http = {
              spec: true,
              status: 400
            };
          }
          throw result;
        }
        assertMutationViaGet(request.method, result, operationName);
      };
    }
  };
}
function useHealthCheck({ id = Date.now().toString(), logger = console, endpoint = "/health" } = {}) {
  return {
    onRequest({ endResponse: endResponse2, fetchAPI, request }) {
      if (request.url.endsWith(endpoint)) {
        logger.debug("Responding Health Check");
        const response = new fetchAPI.Response(null, {
          status: 200,
          headers: {
            "x-yoga-id": id
          }
        });
        endResponse2(response);
      }
    }
  };
}
const perf = typeof performance === "object" && performance && typeof performance.now === "function" ? performance : Date;
const warned = /* @__PURE__ */ new Set();
const PROCESS = typeof process === "object" && !!process ? process : {};
const emitWarning = (msg, type, code, fn) => {
  typeof PROCESS.emitWarning === "function" ? PROCESS.emitWarning(msg, type, code, fn) : console.error(`[${code}] ${type}: ${msg}`);
};
let AC = globalThis.AbortController;
let AS = globalThis.AbortSignal;
if (typeof AC === "undefined") {
  AS = class AbortSignal {
    constructor() {
      __publicField(this, "onabort");
      __publicField(this, "_onabort", []);
      __publicField(this, "reason");
      __publicField(this, "aborted", false);
    }
    addEventListener(_, fn) {
      this._onabort.push(fn);
    }
  };
  AC = class AbortController {
    constructor() {
      __publicField(this, "signal", new AS());
      warnACPolyfill();
    }
    abort(reason) {
      var _a, _b2;
      if (this.signal.aborted)
        return;
      this.signal.reason = reason;
      this.signal.aborted = true;
      for (const fn of this.signal._onabort) {
        fn(reason);
      }
      (_b2 = (_a = this.signal).onabort) == null ? void 0 : _b2.call(_a, reason);
    }
  };
  let printACPolyfillWarning = ((_d = PROCESS.env) == null ? void 0 : _d.LRU_CACHE_IGNORE_AC_WARNING) !== "1";
  const warnACPolyfill = () => {
    if (!printACPolyfillWarning)
      return;
    printACPolyfillWarning = false;
    emitWarning("AbortController is not defined. If using lru-cache in node 14, load an AbortController polyfill from the `node-abort-controller` package. A minimal polyfill is provided for use by LRUCache.fetch(), but it should not be relied upon in other contexts (eg, passing it to other APIs that use AbortController/AbortSignal might have undesirable effects). You may disable this with LRU_CACHE_IGNORE_AC_WARNING=1 in the env.", "NO_ABORT_CONTROLLER", "ENOTSUP", warnACPolyfill);
  };
}
const shouldWarn = (code) => !warned.has(code);
const isPosInt = (n) => n && n === Math.floor(n) && n > 0 && isFinite(n);
const getUintArray = (max) => !isPosInt(max) ? null : max <= Math.pow(2, 8) ? Uint8Array : max <= Math.pow(2, 16) ? Uint16Array : max <= Math.pow(2, 32) ? Uint32Array : max <= Number.MAX_SAFE_INTEGER ? ZeroArray : null;
class ZeroArray extends Array {
  constructor(size) {
    super(size);
    this.fill(0);
  }
}
const _Stack = class _Stack {
  constructor(max, HeapCls) {
    __publicField(this, "heap");
    __publicField(this, "length");
    if (!__privateGet(_Stack, _constructing)) {
      throw new TypeError("instantiate Stack using Stack.create(n)");
    }
    this.heap = new HeapCls(max);
    this.length = 0;
  }
  static create(max) {
    const HeapCls = getUintArray(max);
    if (!HeapCls)
      return [];
    __privateSet(_Stack, _constructing, true);
    const s = new _Stack(max, HeapCls);
    __privateSet(_Stack, _constructing, false);
    return s;
  }
  push(n) {
    this.heap[this.length++] = n;
  }
  pop() {
    return this.heap[--this.length];
  }
};
_constructing = new WeakMap();
// private constructor
__privateAdd(_Stack, _constructing, false);
let Stack = _Stack;
const _LRUCache = class _LRUCache {
  constructor(options) {
    __privateAdd(this, _initializeTTLTracking);
    __privateAdd(this, _initializeSizeTracking);
    __privateAdd(this, _indexes);
    __privateAdd(this, _rindexes);
    __privateAdd(this, _isValidIndex);
    __privateAdd(this, _evict);
    __privateAdd(this, _backgroundFetch);
    __privateAdd(this, _isBackgroundFetch);
    __privateAdd(this, _connect);
    __privateAdd(this, _moveToTail);
    // properties coming in from the options of these, only max and maxSize
    // really *need* to be protected. The rest can be modified, as they just
    // set defaults for various methods.
    __privateAdd(this, _max, void 0);
    __privateAdd(this, _maxSize, void 0);
    __privateAdd(this, _dispose, void 0);
    __privateAdd(this, _disposeAfter, void 0);
    __privateAdd(this, _fetchMethod, void 0);
    /**
     * {@link LRUCache.OptionsBase.ttl}
     */
    __publicField(this, "ttl");
    /**
     * {@link LRUCache.OptionsBase.ttlResolution}
     */
    __publicField(this, "ttlResolution");
    /**
     * {@link LRUCache.OptionsBase.ttlAutopurge}
     */
    __publicField(this, "ttlAutopurge");
    /**
     * {@link LRUCache.OptionsBase.updateAgeOnGet}
     */
    __publicField(this, "updateAgeOnGet");
    /**
     * {@link LRUCache.OptionsBase.updateAgeOnHas}
     */
    __publicField(this, "updateAgeOnHas");
    /**
     * {@link LRUCache.OptionsBase.allowStale}
     */
    __publicField(this, "allowStale");
    /**
     * {@link LRUCache.OptionsBase.noDisposeOnSet}
     */
    __publicField(this, "noDisposeOnSet");
    /**
     * {@link LRUCache.OptionsBase.noUpdateTTL}
     */
    __publicField(this, "noUpdateTTL");
    /**
     * {@link LRUCache.OptionsBase.maxEntrySize}
     */
    __publicField(this, "maxEntrySize");
    /**
     * {@link LRUCache.OptionsBase.sizeCalculation}
     */
    __publicField(this, "sizeCalculation");
    /**
     * {@link LRUCache.OptionsBase.noDeleteOnFetchRejection}
     */
    __publicField(this, "noDeleteOnFetchRejection");
    /**
     * {@link LRUCache.OptionsBase.noDeleteOnStaleGet}
     */
    __publicField(this, "noDeleteOnStaleGet");
    /**
     * {@link LRUCache.OptionsBase.allowStaleOnFetchAbort}
     */
    __publicField(this, "allowStaleOnFetchAbort");
    /**
     * {@link LRUCache.OptionsBase.allowStaleOnFetchRejection}
     */
    __publicField(this, "allowStaleOnFetchRejection");
    /**
     * {@link LRUCache.OptionsBase.ignoreFetchAbort}
     */
    __publicField(this, "ignoreFetchAbort");
    // computed properties
    __privateAdd(this, _size, void 0);
    __privateAdd(this, _calculatedSize, void 0);
    __privateAdd(this, _keyMap, void 0);
    __privateAdd(this, _keyList, void 0);
    __privateAdd(this, _valList, void 0);
    __privateAdd(this, _next, void 0);
    __privateAdd(this, _prev, void 0);
    __privateAdd(this, _head, void 0);
    __privateAdd(this, _tail, void 0);
    __privateAdd(this, _free, void 0);
    __privateAdd(this, _disposed, void 0);
    __privateAdd(this, _sizes, void 0);
    __privateAdd(this, _starts, void 0);
    __privateAdd(this, _ttls, void 0);
    __privateAdd(this, _hasDispose, void 0);
    __privateAdd(this, _hasFetchMethod, void 0);
    __privateAdd(this, _hasDisposeAfter, void 0);
    // conditionally set private methods related to TTL
    __privateAdd(this, _updateItemAge, () => {
    });
    __privateAdd(this, _statusTTL, () => {
    });
    __privateAdd(this, _setItemTTL, () => {
    });
    /* c8 ignore stop */
    __privateAdd(this, _isStale, () => false);
    __privateAdd(this, _removeItemSize, (_i) => {
    });
    __privateAdd(this, _addItemSize, (_i, _s, _st) => {
    });
    __privateAdd(this, _requireSize, (_k, _v, size, sizeCalculation) => {
      if (size || sizeCalculation) {
        throw new TypeError("cannot set size without setting maxSize or maxEntrySize on cache");
      }
      return 0;
    });
    /**
     * A String value that is used in the creation of the default string description of an object.
     * Called by the built-in method Object.prototype.toString.
     */
    __publicField(this, _e, "LRUCache");
    const { max = 0, ttl, ttlResolution = 1, ttlAutopurge, updateAgeOnGet, updateAgeOnHas, allowStale, dispose, disposeAfter, noDisposeOnSet, noUpdateTTL, maxSize = 0, maxEntrySize = 0, sizeCalculation, fetchMethod, noDeleteOnFetchRejection, noDeleteOnStaleGet, allowStaleOnFetchRejection, allowStaleOnFetchAbort, ignoreFetchAbort } = options;
    if (max !== 0 && !isPosInt(max)) {
      throw new TypeError("max option must be a nonnegative integer");
    }
    const UintArray = max ? getUintArray(max) : Array;
    if (!UintArray) {
      throw new Error("invalid max value: " + max);
    }
    __privateSet(this, _max, max);
    __privateSet(this, _maxSize, maxSize);
    this.maxEntrySize = maxEntrySize || __privateGet(this, _maxSize);
    this.sizeCalculation = sizeCalculation;
    if (this.sizeCalculation) {
      if (!__privateGet(this, _maxSize) && !this.maxEntrySize) {
        throw new TypeError("cannot set sizeCalculation without setting maxSize or maxEntrySize");
      }
      if (typeof this.sizeCalculation !== "function") {
        throw new TypeError("sizeCalculation set to non-function");
      }
    }
    if (fetchMethod !== void 0 && typeof fetchMethod !== "function") {
      throw new TypeError("fetchMethod must be a function if specified");
    }
    __privateSet(this, _fetchMethod, fetchMethod);
    __privateSet(this, _hasFetchMethod, !!fetchMethod);
    __privateSet(this, _keyMap, /* @__PURE__ */ new Map());
    __privateSet(this, _keyList, new Array(max).fill(void 0));
    __privateSet(this, _valList, new Array(max).fill(void 0));
    __privateSet(this, _next, new UintArray(max));
    __privateSet(this, _prev, new UintArray(max));
    __privateSet(this, _head, 0);
    __privateSet(this, _tail, 0);
    __privateSet(this, _free, Stack.create(max));
    __privateSet(this, _size, 0);
    __privateSet(this, _calculatedSize, 0);
    if (typeof dispose === "function") {
      __privateSet(this, _dispose, dispose);
    }
    if (typeof disposeAfter === "function") {
      __privateSet(this, _disposeAfter, disposeAfter);
      __privateSet(this, _disposed, []);
    } else {
      __privateSet(this, _disposeAfter, void 0);
      __privateSet(this, _disposed, void 0);
    }
    __privateSet(this, _hasDispose, !!__privateGet(this, _dispose));
    __privateSet(this, _hasDisposeAfter, !!__privateGet(this, _disposeAfter));
    this.noDisposeOnSet = !!noDisposeOnSet;
    this.noUpdateTTL = !!noUpdateTTL;
    this.noDeleteOnFetchRejection = !!noDeleteOnFetchRejection;
    this.allowStaleOnFetchRejection = !!allowStaleOnFetchRejection;
    this.allowStaleOnFetchAbort = !!allowStaleOnFetchAbort;
    this.ignoreFetchAbort = !!ignoreFetchAbort;
    if (this.maxEntrySize !== 0) {
      if (__privateGet(this, _maxSize) !== 0) {
        if (!isPosInt(__privateGet(this, _maxSize))) {
          throw new TypeError("maxSize must be a positive integer if specified");
        }
      }
      if (!isPosInt(this.maxEntrySize)) {
        throw new TypeError("maxEntrySize must be a positive integer if specified");
      }
      __privateMethod(this, _initializeSizeTracking, initializeSizeTracking_fn).call(this);
    }
    this.allowStale = !!allowStale;
    this.noDeleteOnStaleGet = !!noDeleteOnStaleGet;
    this.updateAgeOnGet = !!updateAgeOnGet;
    this.updateAgeOnHas = !!updateAgeOnHas;
    this.ttlResolution = isPosInt(ttlResolution) || ttlResolution === 0 ? ttlResolution : 1;
    this.ttlAutopurge = !!ttlAutopurge;
    this.ttl = ttl || 0;
    if (this.ttl) {
      if (!isPosInt(this.ttl)) {
        throw new TypeError("ttl must be a positive integer if specified");
      }
      __privateMethod(this, _initializeTTLTracking, initializeTTLTracking_fn).call(this);
    }
    if (__privateGet(this, _max) === 0 && this.ttl === 0 && __privateGet(this, _maxSize) === 0) {
      throw new TypeError("At least one of max, maxSize, or ttl is required");
    }
    if (!this.ttlAutopurge && !__privateGet(this, _max) && !__privateGet(this, _maxSize)) {
      const code = "LRU_CACHE_UNBOUNDED";
      if (shouldWarn(code)) {
        warned.add(code);
        const msg = "TTL caching without ttlAutopurge, max, or maxSize can result in unbounded memory consumption.";
        emitWarning(msg, "UnboundedCacheWarning", code, _LRUCache);
      }
    }
  }
  /**
   * Do not call this method unless you need to inspect the
   * inner workings of the cache.  If anything returned by this
   * object is modified in any way, strange breakage may occur.
   *
   * These fields are private for a reason!
   *
   * @internal
   */
  static unsafeExposeInternals(c) {
    return {
      // properties
      starts: __privateGet(c, _starts),
      ttls: __privateGet(c, _ttls),
      sizes: __privateGet(c, _sizes),
      keyMap: __privateGet(c, _keyMap),
      keyList: __privateGet(c, _keyList),
      valList: __privateGet(c, _valList),
      next: __privateGet(c, _next),
      prev: __privateGet(c, _prev),
      get head() {
        return __privateGet(c, _head);
      },
      get tail() {
        return __privateGet(c, _tail);
      },
      free: __privateGet(c, _free),
      // methods
      isBackgroundFetch: (p) => {
        var _a;
        return __privateMethod(_a = c, _isBackgroundFetch, isBackgroundFetch_fn).call(_a, p);
      },
      backgroundFetch: (k, index, options, context) => {
        var _a;
        return __privateMethod(_a = c, _backgroundFetch, backgroundFetch_fn).call(_a, k, index, options, context);
      },
      moveToTail: (index) => {
        var _a;
        return __privateMethod(_a = c, _moveToTail, moveToTail_fn).call(_a, index);
      },
      indexes: (options) => {
        var _a;
        return __privateMethod(_a = c, _indexes, indexes_fn).call(_a, options);
      },
      rindexes: (options) => {
        var _a;
        return __privateMethod(_a = c, _rindexes, rindexes_fn).call(_a, options);
      },
      isStale: (index) => {
        var _a;
        return __privateGet(_a = c, _isStale).call(_a, index);
      }
    };
  }
  // Protected read-only members
  /**
   * {@link LRUCache.OptionsBase.max} (read-only)
   */
  get max() {
    return __privateGet(this, _max);
  }
  /**
   * {@link LRUCache.OptionsBase.maxSize} (read-only)
   */
  get maxSize() {
    return __privateGet(this, _maxSize);
  }
  /**
   * The total computed size of items in the cache (read-only)
   */
  get calculatedSize() {
    return __privateGet(this, _calculatedSize);
  }
  /**
   * The number of items stored in the cache (read-only)
   */
  get size() {
    return __privateGet(this, _size);
  }
  /**
   * {@link LRUCache.OptionsBase.fetchMethod} (read-only)
   */
  get fetchMethod() {
    return __privateGet(this, _fetchMethod);
  }
  /**
   * {@link LRUCache.OptionsBase.dispose} (read-only)
   */
  get dispose() {
    return __privateGet(this, _dispose);
  }
  /**
   * {@link LRUCache.OptionsBase.disposeAfter} (read-only)
   */
  get disposeAfter() {
    return __privateGet(this, _disposeAfter);
  }
  /**
   * Return the remaining TTL time for a given entry key
   */
  getRemainingTTL(key) {
    return __privateGet(this, _keyMap).has(key) ? Infinity : 0;
  }
  /**
   * Return a generator yielding `[key, value]` pairs,
   * in order from most recently used to least recently used.
   */
  *entries() {
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this)) {
      if (__privateGet(this, _valList)[i] !== void 0 && __privateGet(this, _keyList)[i] !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield [__privateGet(this, _keyList)[i], __privateGet(this, _valList)[i]];
      }
    }
  }
  /**
   * Inverse order version of {@link LRUCache.entries}
   *
   * Return a generator yielding `[key, value]` pairs,
   * in order from least recently used to most recently used.
   */
  *rentries() {
    for (const i of __privateMethod(this, _rindexes, rindexes_fn).call(this)) {
      if (__privateGet(this, _valList)[i] !== void 0 && __privateGet(this, _keyList)[i] !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield [__privateGet(this, _keyList)[i], __privateGet(this, _valList)[i]];
      }
    }
  }
  /**
   * Return a generator yielding the keys in the cache,
   * in order from most recently used to least recently used.
   */
  *keys() {
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this)) {
      const k = __privateGet(this, _keyList)[i];
      if (k !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield k;
      }
    }
  }
  /**
   * Inverse order version of {@link LRUCache.keys}
   *
   * Return a generator yielding the keys in the cache,
   * in order from least recently used to most recently used.
   */
  *rkeys() {
    for (const i of __privateMethod(this, _rindexes, rindexes_fn).call(this)) {
      const k = __privateGet(this, _keyList)[i];
      if (k !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield k;
      }
    }
  }
  /**
   * Return a generator yielding the values in the cache,
   * in order from most recently used to least recently used.
   */
  *values() {
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this)) {
      const v = __privateGet(this, _valList)[i];
      if (v !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield __privateGet(this, _valList)[i];
      }
    }
  }
  /**
   * Inverse order version of {@link LRUCache.values}
   *
   * Return a generator yielding the values in the cache,
   * in order from least recently used to most recently used.
   */
  *rvalues() {
    for (const i of __privateMethod(this, _rindexes, rindexes_fn).call(this)) {
      const v = __privateGet(this, _valList)[i];
      if (v !== void 0 && !__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, __privateGet(this, _valList)[i])) {
        yield __privateGet(this, _valList)[i];
      }
    }
  }
  /**
   * Iterating over the cache itself yields the same results as
   * {@link LRUCache.entries}
   */
  [Symbol.iterator]() {
    return this.entries();
  }
  /**
   * Find a value for which the supplied fn method returns a truthy value,
   * similar to Array.find().  fn is called as fn(value, key, cache).
   */
  find(fn, getOptions = {}) {
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this)) {
      const v = __privateGet(this, _valList)[i];
      const value = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
      if (value === void 0)
        continue;
      if (fn(value, __privateGet(this, _keyList)[i], this)) {
        return this.get(__privateGet(this, _keyList)[i], getOptions);
      }
    }
  }
  /**
   * Call the supplied function on each item in the cache, in order from
   * most recently used to least recently used.  fn is called as
   * fn(value, key, cache).  Does not update age or recenty of use.
   * Does not iterate over stale values.
   */
  forEach(fn, thisp = this) {
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this)) {
      const v = __privateGet(this, _valList)[i];
      const value = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
      if (value === void 0)
        continue;
      fn.call(thisp, value, __privateGet(this, _keyList)[i], this);
    }
  }
  /**
   * The same as {@link LRUCache.forEach} but items are iterated over in
   * reverse order.  (ie, less recently used items are iterated over first.)
   */
  rforEach(fn, thisp = this) {
    for (const i of __privateMethod(this, _rindexes, rindexes_fn).call(this)) {
      const v = __privateGet(this, _valList)[i];
      const value = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
      if (value === void 0)
        continue;
      fn.call(thisp, value, __privateGet(this, _keyList)[i], this);
    }
  }
  /**
   * Delete any stale entries. Returns true if anything was removed,
   * false otherwise.
   */
  purgeStale() {
    let deleted = false;
    for (const i of __privateMethod(this, _rindexes, rindexes_fn).call(this, { allowStale: true })) {
      if (__privateGet(this, _isStale).call(this, i)) {
        this.delete(__privateGet(this, _keyList)[i]);
        deleted = true;
      }
    }
    return deleted;
  }
  /**
   * Get the extended info about a given entry, to get its value, size, and
   * TTL info simultaneously. Like {@link LRUCache#dump}, but just for a
   * single key. Always returns stale values, if their info is found in the
   * cache, so be sure to check for expired TTLs if relevant.
   */
  info(key) {
    const i = __privateGet(this, _keyMap).get(key);
    if (i === void 0)
      return void 0;
    const v = __privateGet(this, _valList)[i];
    const value = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
    if (value === void 0)
      return void 0;
    const entry = { value };
    if (__privateGet(this, _ttls) && __privateGet(this, _starts)) {
      const ttl = __privateGet(this, _ttls)[i];
      const start = __privateGet(this, _starts)[i];
      if (ttl && start) {
        const remain = ttl - (perf.now() - start);
        entry.ttl = remain;
        entry.start = Date.now();
      }
    }
    if (__privateGet(this, _sizes)) {
      entry.size = __privateGet(this, _sizes)[i];
    }
    return entry;
  }
  /**
   * Return an array of [key, {@link LRUCache.Entry}] tuples which can be
   * passed to cache.load()
   */
  dump() {
    const arr = [];
    for (const i of __privateMethod(this, _indexes, indexes_fn).call(this, { allowStale: true })) {
      const key = __privateGet(this, _keyList)[i];
      const v = __privateGet(this, _valList)[i];
      const value = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
      if (value === void 0 || key === void 0)
        continue;
      const entry = { value };
      if (__privateGet(this, _ttls) && __privateGet(this, _starts)) {
        entry.ttl = __privateGet(this, _ttls)[i];
        const age = perf.now() - __privateGet(this, _starts)[i];
        entry.start = Math.floor(Date.now() - age);
      }
      if (__privateGet(this, _sizes)) {
        entry.size = __privateGet(this, _sizes)[i];
      }
      arr.unshift([key, entry]);
    }
    return arr;
  }
  /**
   * Reset the cache and load in the items in entries in the order listed.
   * Note that the shape of the resulting cache may be different if the
   * same options are not used in both caches.
   */
  load(arr) {
    this.clear();
    for (const [key, entry] of arr) {
      if (entry.start) {
        const age = Date.now() - entry.start;
        entry.start = perf.now() - age;
      }
      this.set(key, entry.value, entry);
    }
  }
  /**
   * Add a value to the cache.
   *
   * Note: if `undefined` is specified as a value, this is an alias for
   * {@link LRUCache#delete}
   */
  set(k, v, setOptions = {}) {
    var _a, _b2, _c2, _d2, _e2;
    if (v === void 0) {
      this.delete(k);
      return this;
    }
    const { ttl = this.ttl, start, noDisposeOnSet = this.noDisposeOnSet, sizeCalculation = this.sizeCalculation, status } = setOptions;
    let { noUpdateTTL = this.noUpdateTTL } = setOptions;
    const size = __privateGet(this, _requireSize).call(this, k, v, setOptions.size || 0, sizeCalculation);
    if (this.maxEntrySize && size > this.maxEntrySize) {
      if (status) {
        status.set = "miss";
        status.maxEntrySizeExceeded = true;
      }
      this.delete(k);
      return this;
    }
    let index = __privateGet(this, _size) === 0 ? void 0 : __privateGet(this, _keyMap).get(k);
    if (index === void 0) {
      index = __privateGet(this, _size) === 0 ? __privateGet(this, _tail) : __privateGet(this, _free).length !== 0 ? __privateGet(this, _free).pop() : __privateGet(this, _size) === __privateGet(this, _max) ? __privateMethod(this, _evict, evict_fn).call(this, false) : __privateGet(this, _size);
      __privateGet(this, _keyList)[index] = k;
      __privateGet(this, _valList)[index] = v;
      __privateGet(this, _keyMap).set(k, index);
      __privateGet(this, _next)[__privateGet(this, _tail)] = index;
      __privateGet(this, _prev)[index] = __privateGet(this, _tail);
      __privateSet(this, _tail, index);
      __privateWrapper(this, _size)._++;
      __privateGet(this, _addItemSize).call(this, index, size, status);
      if (status)
        status.set = "add";
      noUpdateTTL = false;
    } else {
      __privateMethod(this, _moveToTail, moveToTail_fn).call(this, index);
      const oldVal = __privateGet(this, _valList)[index];
      if (v !== oldVal) {
        if (__privateGet(this, _hasFetchMethod) && __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, oldVal)) {
          oldVal.__abortController.abort(new Error("replaced"));
          const { __staleWhileFetching: s } = oldVal;
          if (s !== void 0 && !noDisposeOnSet) {
            if (__privateGet(this, _hasDispose)) {
              (_a = __privateGet(this, _dispose)) == null ? void 0 : _a.call(this, s, k, "set");
            }
            if (__privateGet(this, _hasDisposeAfter)) {
              (_b2 = __privateGet(this, _disposed)) == null ? void 0 : _b2.push([s, k, "set"]);
            }
          }
        } else if (!noDisposeOnSet) {
          if (__privateGet(this, _hasDispose)) {
            (_c2 = __privateGet(this, _dispose)) == null ? void 0 : _c2.call(this, oldVal, k, "set");
          }
          if (__privateGet(this, _hasDisposeAfter)) {
            (_d2 = __privateGet(this, _disposed)) == null ? void 0 : _d2.push([oldVal, k, "set"]);
          }
        }
        __privateGet(this, _removeItemSize).call(this, index);
        __privateGet(this, _addItemSize).call(this, index, size, status);
        __privateGet(this, _valList)[index] = v;
        if (status) {
          status.set = "replace";
          const oldValue = oldVal && __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, oldVal) ? oldVal.__staleWhileFetching : oldVal;
          if (oldValue !== void 0)
            status.oldValue = oldValue;
        }
      } else if (status) {
        status.set = "update";
      }
    }
    if (ttl !== 0 && !__privateGet(this, _ttls)) {
      __privateMethod(this, _initializeTTLTracking, initializeTTLTracking_fn).call(this);
    }
    if (__privateGet(this, _ttls)) {
      if (!noUpdateTTL) {
        __privateGet(this, _setItemTTL).call(this, index, ttl, start);
      }
      if (status)
        __privateGet(this, _statusTTL).call(this, status, index);
    }
    if (!noDisposeOnSet && __privateGet(this, _hasDisposeAfter) && __privateGet(this, _disposed)) {
      const dt = __privateGet(this, _disposed);
      let task;
      while (task = dt == null ? void 0 : dt.shift()) {
        (_e2 = __privateGet(this, _disposeAfter)) == null ? void 0 : _e2.call(this, ...task);
      }
    }
    return this;
  }
  /**
   * Evict the least recently used item, returning its value or
   * `undefined` if cache is empty.
   */
  pop() {
    var _a;
    try {
      while (__privateGet(this, _size)) {
        const val = __privateGet(this, _valList)[__privateGet(this, _head)];
        __privateMethod(this, _evict, evict_fn).call(this, true);
        if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, val)) {
          if (val.__staleWhileFetching) {
            return val.__staleWhileFetching;
          }
        } else if (val !== void 0) {
          return val;
        }
      }
    } finally {
      if (__privateGet(this, _hasDisposeAfter) && __privateGet(this, _disposed)) {
        const dt = __privateGet(this, _disposed);
        let task;
        while (task = dt == null ? void 0 : dt.shift()) {
          (_a = __privateGet(this, _disposeAfter)) == null ? void 0 : _a.call(this, ...task);
        }
      }
    }
  }
  /**
   * Check if a key is in the cache, without updating the recency of use.
   * Will return false if the item is stale, even though it is technically
   * in the cache.
   *
   * Will not update item age unless
   * {@link LRUCache.OptionsBase.updateAgeOnHas} is set.
   */
  has(k, hasOptions = {}) {
    const { updateAgeOnHas = this.updateAgeOnHas, status } = hasOptions;
    const index = __privateGet(this, _keyMap).get(k);
    if (index !== void 0) {
      const v = __privateGet(this, _valList)[index];
      if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) && v.__staleWhileFetching === void 0) {
        return false;
      }
      if (!__privateGet(this, _isStale).call(this, index)) {
        if (updateAgeOnHas) {
          __privateGet(this, _updateItemAge).call(this, index);
        }
        if (status) {
          status.has = "hit";
          __privateGet(this, _statusTTL).call(this, status, index);
        }
        return true;
      } else if (status) {
        status.has = "stale";
        __privateGet(this, _statusTTL).call(this, status, index);
      }
    } else if (status) {
      status.has = "miss";
    }
    return false;
  }
  /**
   * Like {@link LRUCache#get} but doesn't update recency or delete stale
   * items.
   *
   * Returns `undefined` if the item is stale, unless
   * {@link LRUCache.OptionsBase.allowStale} is set.
   */
  peek(k, peekOptions = {}) {
    const { allowStale = this.allowStale } = peekOptions;
    const index = __privateGet(this, _keyMap).get(k);
    if (index === void 0 || !allowStale && __privateGet(this, _isStale).call(this, index)) {
      return;
    }
    const v = __privateGet(this, _valList)[index];
    return __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v) ? v.__staleWhileFetching : v;
  }
  async fetch(k, fetchOptions = {}) {
    const {
      // get options
      allowStale = this.allowStale,
      updateAgeOnGet = this.updateAgeOnGet,
      noDeleteOnStaleGet = this.noDeleteOnStaleGet,
      // set options
      ttl = this.ttl,
      noDisposeOnSet = this.noDisposeOnSet,
      size = 0,
      sizeCalculation = this.sizeCalculation,
      noUpdateTTL = this.noUpdateTTL,
      // fetch exclusive options
      noDeleteOnFetchRejection = this.noDeleteOnFetchRejection,
      allowStaleOnFetchRejection = this.allowStaleOnFetchRejection,
      ignoreFetchAbort = this.ignoreFetchAbort,
      allowStaleOnFetchAbort = this.allowStaleOnFetchAbort,
      context,
      forceRefresh = false,
      status,
      signal
    } = fetchOptions;
    if (!__privateGet(this, _hasFetchMethod)) {
      if (status)
        status.fetch = "get";
      return this.get(k, {
        allowStale,
        updateAgeOnGet,
        noDeleteOnStaleGet,
        status
      });
    }
    const options = {
      allowStale,
      updateAgeOnGet,
      noDeleteOnStaleGet,
      ttl,
      noDisposeOnSet,
      size,
      sizeCalculation,
      noUpdateTTL,
      noDeleteOnFetchRejection,
      allowStaleOnFetchRejection,
      allowStaleOnFetchAbort,
      ignoreFetchAbort,
      status,
      signal
    };
    let index = __privateGet(this, _keyMap).get(k);
    if (index === void 0) {
      if (status)
        status.fetch = "miss";
      const p = __privateMethod(this, _backgroundFetch, backgroundFetch_fn).call(this, k, index, options, context);
      return p.__returned = p;
    } else {
      const v = __privateGet(this, _valList)[index];
      if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
        const stale = allowStale && v.__staleWhileFetching !== void 0;
        if (status) {
          status.fetch = "inflight";
          if (stale)
            status.returnedStale = true;
        }
        return stale ? v.__staleWhileFetching : v.__returned = v;
      }
      const isStale = __privateGet(this, _isStale).call(this, index);
      if (!forceRefresh && !isStale) {
        if (status)
          status.fetch = "hit";
        __privateMethod(this, _moveToTail, moveToTail_fn).call(this, index);
        if (updateAgeOnGet) {
          __privateGet(this, _updateItemAge).call(this, index);
        }
        if (status)
          __privateGet(this, _statusTTL).call(this, status, index);
        return v;
      }
      const p = __privateMethod(this, _backgroundFetch, backgroundFetch_fn).call(this, k, index, options, context);
      const hasStale = p.__staleWhileFetching !== void 0;
      const staleVal = hasStale && allowStale;
      if (status) {
        status.fetch = isStale ? "stale" : "refresh";
        if (staleVal && isStale)
          status.returnedStale = true;
      }
      return staleVal ? p.__staleWhileFetching : p.__returned = p;
    }
  }
  /**
   * Return a value from the cache. Will update the recency of the cache
   * entry found.
   *
   * If the key is not found, get() will return `undefined`.
   */
  get(k, getOptions = {}) {
    const { allowStale = this.allowStale, updateAgeOnGet = this.updateAgeOnGet, noDeleteOnStaleGet = this.noDeleteOnStaleGet, status } = getOptions;
    const index = __privateGet(this, _keyMap).get(k);
    if (index !== void 0) {
      const value = __privateGet(this, _valList)[index];
      const fetching = __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, value);
      if (status)
        __privateGet(this, _statusTTL).call(this, status, index);
      if (__privateGet(this, _isStale).call(this, index)) {
        if (status)
          status.get = "stale";
        if (!fetching) {
          if (!noDeleteOnStaleGet) {
            this.delete(k);
          }
          if (status && allowStale)
            status.returnedStale = true;
          return allowStale ? value : void 0;
        } else {
          if (status && allowStale && value.__staleWhileFetching !== void 0) {
            status.returnedStale = true;
          }
          return allowStale ? value.__staleWhileFetching : void 0;
        }
      } else {
        if (status)
          status.get = "hit";
        if (fetching) {
          return value.__staleWhileFetching;
        }
        __privateMethod(this, _moveToTail, moveToTail_fn).call(this, index);
        if (updateAgeOnGet) {
          __privateGet(this, _updateItemAge).call(this, index);
        }
        return value;
      }
    } else if (status) {
      status.get = "miss";
    }
  }
  /**
   * Deletes a key out of the cache.
   * Returns true if the key was deleted, false otherwise.
   */
  delete(k) {
    var _a, _b2, _c2, _d2;
    let deleted = false;
    if (__privateGet(this, _size) !== 0) {
      const index = __privateGet(this, _keyMap).get(k);
      if (index !== void 0) {
        deleted = true;
        if (__privateGet(this, _size) === 1) {
          this.clear();
        } else {
          __privateGet(this, _removeItemSize).call(this, index);
          const v = __privateGet(this, _valList)[index];
          if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
            v.__abortController.abort(new Error("deleted"));
          } else if (__privateGet(this, _hasDispose) || __privateGet(this, _hasDisposeAfter)) {
            if (__privateGet(this, _hasDispose)) {
              (_a = __privateGet(this, _dispose)) == null ? void 0 : _a.call(this, v, k, "delete");
            }
            if (__privateGet(this, _hasDisposeAfter)) {
              (_b2 = __privateGet(this, _disposed)) == null ? void 0 : _b2.push([v, k, "delete"]);
            }
          }
          __privateGet(this, _keyMap).delete(k);
          __privateGet(this, _keyList)[index] = void 0;
          __privateGet(this, _valList)[index] = void 0;
          if (index === __privateGet(this, _tail)) {
            __privateSet(this, _tail, __privateGet(this, _prev)[index]);
          } else if (index === __privateGet(this, _head)) {
            __privateSet(this, _head, __privateGet(this, _next)[index]);
          } else {
            const pi = __privateGet(this, _prev)[index];
            __privateGet(this, _next)[pi] = __privateGet(this, _next)[index];
            const ni = __privateGet(this, _next)[index];
            __privateGet(this, _prev)[ni] = __privateGet(this, _prev)[index];
          }
          __privateWrapper(this, _size)._--;
          __privateGet(this, _free).push(index);
        }
      }
    }
    if (__privateGet(this, _hasDisposeAfter) && ((_c2 = __privateGet(this, _disposed)) == null ? void 0 : _c2.length)) {
      const dt = __privateGet(this, _disposed);
      let task;
      while (task = dt == null ? void 0 : dt.shift()) {
        (_d2 = __privateGet(this, _disposeAfter)) == null ? void 0 : _d2.call(this, ...task);
      }
    }
    return deleted;
  }
  /**
   * Clear the cache entirely, throwing away all values.
   */
  clear() {
    var _a, _b2, _c2;
    for (const index of __privateMethod(this, _rindexes, rindexes_fn).call(this, { allowStale: true })) {
      const v = __privateGet(this, _valList)[index];
      if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
        v.__abortController.abort(new Error("deleted"));
      } else {
        const k = __privateGet(this, _keyList)[index];
        if (__privateGet(this, _hasDispose)) {
          (_a = __privateGet(this, _dispose)) == null ? void 0 : _a.call(this, v, k, "delete");
        }
        if (__privateGet(this, _hasDisposeAfter)) {
          (_b2 = __privateGet(this, _disposed)) == null ? void 0 : _b2.push([v, k, "delete"]);
        }
      }
    }
    __privateGet(this, _keyMap).clear();
    __privateGet(this, _valList).fill(void 0);
    __privateGet(this, _keyList).fill(void 0);
    if (__privateGet(this, _ttls) && __privateGet(this, _starts)) {
      __privateGet(this, _ttls).fill(0);
      __privateGet(this, _starts).fill(0);
    }
    if (__privateGet(this, _sizes)) {
      __privateGet(this, _sizes).fill(0);
    }
    __privateSet(this, _head, 0);
    __privateSet(this, _tail, 0);
    __privateGet(this, _free).length = 0;
    __privateSet(this, _calculatedSize, 0);
    __privateSet(this, _size, 0);
    if (__privateGet(this, _hasDisposeAfter) && __privateGet(this, _disposed)) {
      const dt = __privateGet(this, _disposed);
      let task;
      while (task = dt == null ? void 0 : dt.shift()) {
        (_c2 = __privateGet(this, _disposeAfter)) == null ? void 0 : _c2.call(this, ...task);
      }
    }
  }
};
_e = Symbol.toStringTag;
_max = new WeakMap();
_maxSize = new WeakMap();
_dispose = new WeakMap();
_disposeAfter = new WeakMap();
_fetchMethod = new WeakMap();
_size = new WeakMap();
_calculatedSize = new WeakMap();
_keyMap = new WeakMap();
_keyList = new WeakMap();
_valList = new WeakMap();
_next = new WeakMap();
_prev = new WeakMap();
_head = new WeakMap();
_tail = new WeakMap();
_free = new WeakMap();
_disposed = new WeakMap();
_sizes = new WeakMap();
_starts = new WeakMap();
_ttls = new WeakMap();
_hasDispose = new WeakMap();
_hasFetchMethod = new WeakMap();
_hasDisposeAfter = new WeakMap();
_initializeTTLTracking = new WeakSet();
initializeTTLTracking_fn = function() {
  const ttls = new ZeroArray(__privateGet(this, _max));
  const starts = new ZeroArray(__privateGet(this, _max));
  __privateSet(this, _ttls, ttls);
  __privateSet(this, _starts, starts);
  __privateSet(this, _setItemTTL, (index, ttl, start = perf.now()) => {
    starts[index] = ttl !== 0 ? start : 0;
    ttls[index] = ttl;
    if (ttl !== 0 && this.ttlAutopurge) {
      const t = setTimeout(() => {
        if (__privateGet(this, _isStale).call(this, index)) {
          this.delete(__privateGet(this, _keyList)[index]);
        }
      }, ttl + 1);
      if (t.unref) {
        t.unref();
      }
    }
  });
  __privateSet(this, _updateItemAge, (index) => {
    starts[index] = ttls[index] !== 0 ? perf.now() : 0;
  });
  __privateSet(this, _statusTTL, (status, index) => {
    if (ttls[index]) {
      const ttl = ttls[index];
      const start = starts[index];
      if (!ttl || !start)
        return;
      status.ttl = ttl;
      status.start = start;
      status.now = cachedNow || getNow();
      const age = status.now - start;
      status.remainingTTL = ttl - age;
    }
  });
  let cachedNow = 0;
  const getNow = () => {
    const n = perf.now();
    if (this.ttlResolution > 0) {
      cachedNow = n;
      const t = setTimeout(() => cachedNow = 0, this.ttlResolution);
      if (t.unref) {
        t.unref();
      }
    }
    return n;
  };
  this.getRemainingTTL = (key) => {
    const index = __privateGet(this, _keyMap).get(key);
    if (index === void 0) {
      return 0;
    }
    const ttl = ttls[index];
    const start = starts[index];
    if (!ttl || !start) {
      return Infinity;
    }
    const age = (cachedNow || getNow()) - start;
    return ttl - age;
  };
  __privateSet(this, _isStale, (index) => {
    const s = starts[index];
    const t = ttls[index];
    return !!t && !!s && (cachedNow || getNow()) - s > t;
  });
};
_updateItemAge = new WeakMap();
_statusTTL = new WeakMap();
_setItemTTL = new WeakMap();
_isStale = new WeakMap();
_initializeSizeTracking = new WeakSet();
initializeSizeTracking_fn = function() {
  const sizes = new ZeroArray(__privateGet(this, _max));
  __privateSet(this, _calculatedSize, 0);
  __privateSet(this, _sizes, sizes);
  __privateSet(this, _removeItemSize, (index) => {
    __privateSet(this, _calculatedSize, __privateGet(this, _calculatedSize) - sizes[index]);
    sizes[index] = 0;
  });
  __privateSet(this, _requireSize, (k, v, size, sizeCalculation) => {
    if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
      return 0;
    }
    if (!isPosInt(size)) {
      if (sizeCalculation) {
        if (typeof sizeCalculation !== "function") {
          throw new TypeError("sizeCalculation must be a function");
        }
        size = sizeCalculation(v, k);
        if (!isPosInt(size)) {
          throw new TypeError("sizeCalculation return invalid (expect positive integer)");
        }
      } else {
        throw new TypeError("invalid size value (must be positive integer). When maxSize or maxEntrySize is used, sizeCalculation or size must be set.");
      }
    }
    return size;
  });
  __privateSet(this, _addItemSize, (index, size, status) => {
    sizes[index] = size;
    if (__privateGet(this, _maxSize)) {
      const maxSize = __privateGet(this, _maxSize) - sizes[index];
      while (__privateGet(this, _calculatedSize) > maxSize) {
        __privateMethod(this, _evict, evict_fn).call(this, true);
      }
    }
    __privateSet(this, _calculatedSize, __privateGet(this, _calculatedSize) + sizes[index]);
    if (status) {
      status.entrySize = size;
      status.totalCalculatedSize = __privateGet(this, _calculatedSize);
    }
  });
};
_removeItemSize = new WeakMap();
_addItemSize = new WeakMap();
_requireSize = new WeakMap();
_indexes = new WeakSet();
indexes_fn = function* ({ allowStale = this.allowStale } = {}) {
  if (__privateGet(this, _size)) {
    for (let i = __privateGet(this, _tail); true; ) {
      if (!__privateMethod(this, _isValidIndex, isValidIndex_fn).call(this, i)) {
        break;
      }
      if (allowStale || !__privateGet(this, _isStale).call(this, i)) {
        yield i;
      }
      if (i === __privateGet(this, _head)) {
        break;
      } else {
        i = __privateGet(this, _prev)[i];
      }
    }
  }
};
_rindexes = new WeakSet();
rindexes_fn = function* ({ allowStale = this.allowStale } = {}) {
  if (__privateGet(this, _size)) {
    for (let i = __privateGet(this, _head); true; ) {
      if (!__privateMethod(this, _isValidIndex, isValidIndex_fn).call(this, i)) {
        break;
      }
      if (allowStale || !__privateGet(this, _isStale).call(this, i)) {
        yield i;
      }
      if (i === __privateGet(this, _tail)) {
        break;
      } else {
        i = __privateGet(this, _next)[i];
      }
    }
  }
};
_isValidIndex = new WeakSet();
isValidIndex_fn = function(index) {
  return index !== void 0 && __privateGet(this, _keyMap).get(__privateGet(this, _keyList)[index]) === index;
};
_evict = new WeakSet();
evict_fn = function(free) {
  var _a, _b2;
  const head = __privateGet(this, _head);
  const k = __privateGet(this, _keyList)[head];
  const v = __privateGet(this, _valList)[head];
  if (__privateGet(this, _hasFetchMethod) && __privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
    v.__abortController.abort(new Error("evicted"));
  } else if (__privateGet(this, _hasDispose) || __privateGet(this, _hasDisposeAfter)) {
    if (__privateGet(this, _hasDispose)) {
      (_a = __privateGet(this, _dispose)) == null ? void 0 : _a.call(this, v, k, "evict");
    }
    if (__privateGet(this, _hasDisposeAfter)) {
      (_b2 = __privateGet(this, _disposed)) == null ? void 0 : _b2.push([v, k, "evict"]);
    }
  }
  __privateGet(this, _removeItemSize).call(this, head);
  if (free) {
    __privateGet(this, _keyList)[head] = void 0;
    __privateGet(this, _valList)[head] = void 0;
    __privateGet(this, _free).push(head);
  }
  if (__privateGet(this, _size) === 1) {
    __privateSet(this, _head, __privateSet(this, _tail, 0));
    __privateGet(this, _free).length = 0;
  } else {
    __privateSet(this, _head, __privateGet(this, _next)[head]);
  }
  __privateGet(this, _keyMap).delete(k);
  __privateWrapper(this, _size)._--;
  return head;
};
_backgroundFetch = new WeakSet();
backgroundFetch_fn = function(k, index, options, context) {
  const v = index === void 0 ? void 0 : __privateGet(this, _valList)[index];
  if (__privateMethod(this, _isBackgroundFetch, isBackgroundFetch_fn).call(this, v)) {
    return v;
  }
  const ac = new AC();
  const { signal } = options;
  signal == null ? void 0 : signal.addEventListener("abort", () => ac.abort(signal.reason), {
    signal: ac.signal
  });
  const fetchOpts = {
    signal: ac.signal,
    options,
    context
  };
  const cb = (v2, updateCache = false) => {
    const { aborted } = ac.signal;
    const ignoreAbort = options.ignoreFetchAbort && v2 !== void 0;
    if (options.status) {
      if (aborted && !updateCache) {
        options.status.fetchAborted = true;
        options.status.fetchError = ac.signal.reason;
        if (ignoreAbort)
          options.status.fetchAbortIgnored = true;
      } else {
        options.status.fetchResolved = true;
      }
    }
    if (aborted && !ignoreAbort && !updateCache) {
      return fetchFail(ac.signal.reason);
    }
    const bf2 = p;
    if (__privateGet(this, _valList)[index] === p) {
      if (v2 === void 0) {
        if (bf2.__staleWhileFetching) {
          __privateGet(this, _valList)[index] = bf2.__staleWhileFetching;
        } else {
          this.delete(k);
        }
      } else {
        if (options.status)
          options.status.fetchUpdated = true;
        this.set(k, v2, fetchOpts.options);
      }
    }
    return v2;
  };
  const eb = (er) => {
    if (options.status) {
      options.status.fetchRejected = true;
      options.status.fetchError = er;
    }
    return fetchFail(er);
  };
  const fetchFail = (er) => {
    const { aborted } = ac.signal;
    const allowStaleAborted = aborted && options.allowStaleOnFetchAbort;
    const allowStale = allowStaleAborted || options.allowStaleOnFetchRejection;
    const noDelete = allowStale || options.noDeleteOnFetchRejection;
    const bf2 = p;
    if (__privateGet(this, _valList)[index] === p) {
      const del = !noDelete || bf2.__staleWhileFetching === void 0;
      if (del) {
        this.delete(k);
      } else if (!allowStaleAborted) {
        __privateGet(this, _valList)[index] = bf2.__staleWhileFetching;
      }
    }
    if (allowStale) {
      if (options.status && bf2.__staleWhileFetching !== void 0) {
        options.status.returnedStale = true;
      }
      return bf2.__staleWhileFetching;
    } else if (bf2.__returned === bf2) {
      throw er;
    }
  };
  const pcall = (res, rej) => {
    var _a;
    const fmp = (_a = __privateGet(this, _fetchMethod)) == null ? void 0 : _a.call(this, k, v, fetchOpts);
    if (fmp && fmp instanceof Promise) {
      fmp.then((v2) => res(v2 === void 0 ? void 0 : v2), rej);
    }
    ac.signal.addEventListener("abort", () => {
      if (!options.ignoreFetchAbort || options.allowStaleOnFetchAbort) {
        res(void 0);
        if (options.allowStaleOnFetchAbort) {
          res = (v2) => cb(v2, true);
        }
      }
    });
  };
  if (options.status)
    options.status.fetchDispatched = true;
  const p = new Promise(pcall).then(cb, eb);
  const bf = Object.assign(p, {
    __abortController: ac,
    __staleWhileFetching: v,
    __returned: void 0
  });
  if (index === void 0) {
    this.set(k, bf, { ...fetchOpts.options, status: void 0 });
    index = __privateGet(this, _keyMap).get(k);
  } else {
    __privateGet(this, _valList)[index] = bf;
  }
  return bf;
};
_isBackgroundFetch = new WeakSet();
isBackgroundFetch_fn = function(p) {
  if (!__privateGet(this, _hasFetchMethod))
    return false;
  const b = p;
  return !!b && b instanceof Promise && b.hasOwnProperty("__staleWhileFetching") && b.__abortController instanceof AC;
};
_connect = new WeakSet();
connect_fn = function(p, n) {
  __privateGet(this, _prev)[n] = p;
  __privateGet(this, _next)[p] = n;
};
_moveToTail = new WeakSet();
moveToTail_fn = function(index) {
  if (index !== __privateGet(this, _tail)) {
    if (index === __privateGet(this, _head)) {
      __privateSet(this, _head, __privateGet(this, _next)[index]);
    } else {
      __privateMethod(this, _connect, connect_fn).call(this, __privateGet(this, _prev)[index], __privateGet(this, _next)[index]);
    }
    __privateMethod(this, _connect, connect_fn).call(this, __privateGet(this, _tail), index);
    __privateSet(this, _tail, index);
  }
};
let LRUCache = _LRUCache;
const DEFAULT_MAX = 1024;
const DEFAULT_TTL = 36e5;
function createLRUCache({ max = DEFAULT_MAX, ttl = DEFAULT_TTL } = {}) {
  return new LRUCache({ max, ttl });
}
function useParserAndValidationCache({ documentCache = createLRUCache(), errorCache = createLRUCache(), validationCache = true }) {
  const validationCacheByRules = createLRUCache();
  return {
    onParse({ params, setParsedDocument }) {
      const strDocument = params.source.toString();
      const document = documentCache.get(strDocument);
      if (document) {
        setParsedDocument(document);
        return;
      }
      const parserError = errorCache.get(strDocument);
      if (parserError) {
        throw parserError;
      }
      return ({ result }) => {
        if (result != null) {
          if (result instanceof Error) {
            errorCache.set(strDocument, result);
          } else {
            documentCache.set(strDocument, result);
          }
        }
      };
    },
    onValidate({
      params: { schema, documentAST, rules },
      setResult
      // eslint-disable-next-line @typescript-eslint/ban-types
    }) {
      if (schema == null) {
        return;
      }
      if (validationCache !== false) {
        const rulesKey = (rules == null ? void 0 : rules.map((rule) => rule.name).join(",")) || "";
        let validationCacheBySchema = validationCacheByRules.get(rulesKey);
        if (!validationCacheBySchema) {
          validationCacheBySchema = /* @__PURE__ */ new WeakMap();
          validationCacheByRules.set(rulesKey, validationCacheBySchema);
        }
        let validationCacheByDocument = validationCacheBySchema.get(schema);
        if (!validationCacheByDocument) {
          validationCacheByDocument = /* @__PURE__ */ new WeakMap();
          validationCacheBySchema.set(schema, validationCacheByDocument);
        }
        const cachedResult = validationCacheByDocument.get(documentAST);
        if (cachedResult) {
          setResult(cachedResult);
          return;
        }
        return ({ result }) => {
          if (result != null) {
            validationCacheByDocument == null ? void 0 : validationCacheByDocument.set(documentAST, result);
          }
        };
      }
    }
  };
}
const DEFAULT_MATCHER = () => true;
function useRequestParser(options) {
  const matchFn = options.match || DEFAULT_MATCHER;
  return {
    onRequestParse({ request, setRequestParser }) {
      if (matchFn(request)) {
        setRequestParser(options.parse);
      }
    }
  };
}
function getMediaTypesForRequestInOrder(request) {
  const accepts = (request.headers.get("accept") || "*/*").replace(/\s/g, "").toLowerCase().split(",");
  const mediaTypes = [];
  for (const accept of accepts) {
    const [mediaType, ...params] = accept.split(";");
    const charset = (params == null ? void 0 : params.find((param) => param.includes("charset="))) || "charset=utf-8";
    if (charset !== "charset=utf-8") {
      continue;
    }
    mediaTypes.push(mediaType);
  }
  return mediaTypes.reverse();
}
function isMatchingMediaType(askedMediaType, processorMediaType) {
  const [askedPre, askedSuf] = askedMediaType.split("/");
  const [pre, suf] = processorMediaType.split("/");
  if ((pre === "*" || pre === askedPre) && (suf === "*" || suf === askedSuf)) {
    return true;
  }
  return false;
}
function jsonStringifyResultWithoutInternals(result) {
  if (Array.isArray(result)) {
    return `[${result.map((r) => {
      const sanitizedResult2 = omitInternalsFromResultErrors(r);
      const stringifier2 = r.stringify || JSON.stringify;
      return stringifier2(sanitizedResult2);
    }).join(",")}]`;
  }
  const sanitizedResult = omitInternalsFromResultErrors(result);
  const stringifier = result.stringify || JSON.stringify;
  return stringifier(sanitizedResult);
}
function omitInternalsFromResultErrors(result) {
  var _a, _b2;
  if (((_a = result.errors) == null ? void 0 : _a.length) || ((_b2 = result.extensions) == null ? void 0 : _b2.http)) {
    const newResult = { ...result };
    newResult.errors && (newResult.errors = newResult.errors.map(omitInternalsFromError));
    if (newResult.extensions) {
      const { http, ...extensions } = result.extensions;
      newResult.extensions = Object.keys(extensions).length ? extensions : void 0;
    }
    return newResult;
  }
  return result;
}
function omitInternalsFromError(err) {
  if (isGraphQLError$1(err)) {
    const serializedError = "toJSON" in err && typeof err.toJSON === "function" ? err.toJSON() : Object(err);
    const { http, unexpected, ...extensions } = serializedError.extensions || {};
    return createGraphQLError(err.message, {
      nodes: err.nodes,
      source: err.source,
      positions: err.positions,
      path: err.path,
      originalError: omitInternalsFromError(err.originalError || void 0),
      extensions: Object.keys(extensions).length ? extensions : void 0
    });
  }
  return err;
}
function processMultipartResult(result, fetchAPI) {
  const headersInit = {
    Connection: "keep-alive",
    "Content-Type": 'multipart/mixed; boundary="-"',
    "Transfer-Encoding": "chunked"
  };
  const responseInit = getResponseInitByRespectingErrors(result, headersInit);
  let iterator;
  const textEncoder = new fetchAPI.TextEncoder();
  const readableStream = new fetchAPI.ReadableStream({
    start(controller) {
      if (isAsyncIterable$1(result)) {
        iterator = result[Symbol.asyncIterator]();
      } else {
        let finished = false;
        iterator = {
          next: () => {
            if (finished) {
              return Promise.resolve({ done: true, value: null });
            }
            finished = true;
            return Promise.resolve({ done: false, value: result });
          }
        };
      }
      controller.enqueue(textEncoder.encode(`---`));
    },
    async pull(controller) {
      const { done, value } = await iterator.next();
      if (value != null) {
        controller.enqueue(textEncoder.encode("\r\n"));
        controller.enqueue(textEncoder.encode("Content-Type: application/json; charset=utf-8"));
        controller.enqueue(textEncoder.encode("\r\n"));
        const chunk = jsonStringifyResultWithoutInternals(value);
        const encodedChunk = textEncoder.encode(chunk);
        controller.enqueue(textEncoder.encode("Content-Length: " + encodedChunk.byteLength));
        controller.enqueue(textEncoder.encode("\r\n"));
        controller.enqueue(textEncoder.encode("\r\n"));
        controller.enqueue(encodedChunk);
        controller.enqueue(textEncoder.encode("\r\n"));
        controller.enqueue(textEncoder.encode("---"));
      }
      if (done) {
        controller.enqueue(textEncoder.encode("--\r\n"));
        controller.close();
      }
    },
    async cancel(e) {
      var _a;
      await ((_a = iterator.return) == null ? void 0 : _a.call(iterator, e));
    }
  });
  return new fetchAPI.Response(readableStream, responseInit);
}
function processRegularResult(executionResult, fetchAPI, acceptedHeader) {
  if (isAsyncIterable$2(executionResult)) {
    return new fetchAPI.Response(null, {
      status: 406,
      statusText: "Not Acceptable",
      headers: {
        accept: "application/json; charset=utf-8, application/graphql-response+json; charset=utf-8"
      }
    });
  }
  const headersInit = {
    "Content-Type": acceptedHeader + "; charset=utf-8"
  };
  const responseInit = getResponseInitByRespectingErrors(
    executionResult,
    headersInit,
    // prefer 200 only if accepting application/json and all errors are exclusively GraphQL errors
    acceptedHeader === "application/json" && !Array.isArray(executionResult) && areGraphQLErrors(executionResult.errors) && executionResult.errors.some((err) => {
      var _a;
      return !((_a = err.extensions) == null ? void 0 : _a.originalError) || isGraphQLError$1(err.extensions.originalError);
    })
  );
  const responseBody = jsonStringifyResultWithoutInternals(executionResult);
  return new fetchAPI.Response(responseBody, responseInit);
}
function getSSEProcessor() {
  return function processSSEResult(result, fetchAPI) {
    var _a, _b2;
    let pingIntervalMs = 12e3;
    if (((_b2 = (_a = globalThis.process) == null ? void 0 : _a.env) == null ? void 0 : _b2.NODE_ENV) === "test") {
      pingIntervalMs = 300;
    }
    const headersInit = {
      "Content-Type": "text/event-stream",
      Connection: "keep-alive",
      "Cache-Control": "no-cache",
      "Content-Encoding": "none"
    };
    const responseInit = getResponseInitByRespectingErrors(result, headersInit, true);
    let iterator;
    let pingInterval;
    const textEncoder = new fetchAPI.TextEncoder();
    const readableStream = new fetchAPI.ReadableStream({
      start(controller) {
        controller.enqueue(textEncoder.encode(":\n\n"));
        pingInterval = setInterval(() => {
          if (!controller.desiredSize) {
            clearInterval(pingInterval);
            return;
          }
          controller.enqueue(textEncoder.encode(":\n\n"));
        }, pingIntervalMs);
        if (isAsyncIterable$1(result)) {
          iterator = result[Symbol.asyncIterator]();
        } else {
          let finished = false;
          iterator = {
            next: () => {
              if (finished) {
                return Promise.resolve({ done: true, value: null });
              }
              finished = true;
              return Promise.resolve({ done: false, value: result });
            }
          };
        }
      },
      async pull(controller) {
        const { done, value } = await iterator.next();
        if (value != null) {
          controller.enqueue(textEncoder.encode(`event: next
`));
          const chunk = jsonStringifyResultWithoutInternals(value);
          controller.enqueue(textEncoder.encode(`data: ${chunk}

`));
        }
        if (done) {
          controller.enqueue(textEncoder.encode(`event: complete

`));
          clearInterval(pingInterval);
          controller.close();
        }
      },
      async cancel(e) {
        var _a2;
        clearInterval(pingInterval);
        await ((_a2 = iterator.return) == null ? void 0 : _a2.call(iterator, e));
      }
    });
    return new fetchAPI.Response(readableStream, responseInit);
  };
}
const multipart = {
  mediaTypes: ["multipart/mixed"],
  asyncIterables: true,
  processResult: processMultipartResult
};
function getSSEProcessorConfig() {
  return {
    mediaTypes: ["text/event-stream"],
    asyncIterables: true,
    processResult: getSSEProcessor()
  };
}
const regular = {
  mediaTypes: ["application/graphql-response+json", "application/json"],
  asyncIterables: false,
  processResult: processRegularResult
};
function useResultProcessors() {
  const isSubscriptionRequestMap = /* @__PURE__ */ new WeakMap();
  const sse = getSSEProcessorConfig();
  const defaultList = [sse, multipart, regular];
  const subscriptionList = [sse, regular];
  return {
    onSubscribe({ args: { contextValue } }) {
      if (contextValue.request) {
        isSubscriptionRequestMap.set(contextValue.request, true);
      }
    },
    onResultProcess({ request, result, acceptableMediaTypes, setResultProcessor }) {
      const isSubscriptionRequest = isSubscriptionRequestMap.get(request);
      const processorConfigList = isSubscriptionRequest ? subscriptionList : defaultList;
      const requestMediaTypes = getMediaTypesForRequestInOrder(request);
      const isAsyncIterableResult = isAsyncIterable$1(result);
      for (const resultProcessorConfig of processorConfigList) {
        for (const requestMediaType of requestMediaTypes) {
          if (isAsyncIterableResult && !resultProcessorConfig.asyncIterables) {
            continue;
          }
          for (const processorMediaType of resultProcessorConfig.mediaTypes) {
            acceptableMediaTypes.push(processorMediaType);
            if (isMatchingMediaType(processorMediaType, requestMediaType)) {
              setResultProcessor(resultProcessorConfig.processResult, processorMediaType);
            }
          }
        }
      }
    }
  };
}
const landingPageBody = `<!doctype html><html lang=en><head><meta charset=utf-8><title>Welcome to GraphQL Yoga</title><link rel=icon href=https://raw.githubusercontent.com/dotansimha/graphql-yoga/main/website/public/favicon.ico><style>body,html{padding:0;margin:0;height:100%;font-family:Inter,-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Oxygen,Ubuntu,Cantarell,'Fira Sans','Droid Sans','Helvetica Neue',sans-serif;color:#fff;background-color:#000}main>section.hero{display:flex;height:90vh;justify-content:center;align-items:center;flex-direction:column}.logo{display:flex;align-items:center}.buttons{margin-top:24px}h1{font-size:80px}h2{color:#888;max-width:50%;margin-top:0;text-align:center}a{color:#fff;text-decoration:none;margin-left:10px;margin-right:10px;font-weight:700;transition:color .3s ease;padding:4px;overflow:visible}a.graphiql:hover{color:rgba(255,0,255,.7)}a.docs:hover{color:rgba(28,200,238,.7)}a.tutorial:hover{color:rgba(125,85,245,.7)}svg{margin-right:24px}.not-what-your-looking-for{margin-top:5vh}.not-what-your-looking-for>*{margin-left:auto;margin-right:auto}.not-what-your-looking-for>p{text-align:center}.not-what-your-looking-for>h2{color:#464646}.not-what-your-looking-for>p{max-width:600px;line-height:1.3em}.not-what-your-looking-for>pre{max-width:300px}</style></head><body id=body><main><section class=hero><div class=logo><div><svg xmlns=http://www.w3.org/2000/svg viewBox="-0.41 0.445 472.812 499.811" height=150><defs><linearGradient id=paint0_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse gradientTransform="matrix(8.139854, 0, 0, 8.139854, -130.346407, -113.25101)"><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><linearGradient id=paint1_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse gradientTransform="matrix(8.139854, 0, 0, 8.139854, -130.346407, -113.25101)"><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><linearGradient id=paint2_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse gradientTransform="matrix(8.139854, 0, 0, 8.139854, -130.346407, -113.25101)"><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><linearGradient id=paint3_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><linearGradient id=paint4_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><linearGradient id=paint5_linear_1677_11483 x1=16 y1=14 x2=87.2132 y2=44.5982 gradientUnits=userSpaceOnUse><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><filter id=filter0_f_1677_11483 x=23 y=-25 width=100 height=100 filterUnits=userSpaceOnUse color-interpolation-filters=sRGB><feFlood flood-opacity=0 result=BackgroundImageFix /><feBlend mode=normal in=SourceGraphic in2=BackgroundImageFix result=shape /><feGaussianBlur stdDeviation=12 result=effect1_foregroundBlur_1677_11483 /></filter><filter id=filter1_f_1677_11483 x=-24 y=19 width=100 height=100 filterUnits=userSpaceOnUse color-interpolation-filters=sRGB><feFlood flood-opacity=0 result=BackgroundImageFix /><feBlend mode=normal in=SourceGraphic in2=BackgroundImageFix result=shape /><feGaussianBlur stdDeviation=12 result=effect1_foregroundBlur_1677_11483 /></filter><linearGradient id=paint6_linear_1677_11483 x1=30 y1=28 x2=66.1645 y2=44.4363 gradientUnits=userSpaceOnUse gradientTransform="matrix(8.139854, 0, 0, 8.139854, -130.346407, -113.25101)"><stop stop-color=#7433FF /><stop offset=1 stop-color=#FFA3FD /></linearGradient><filter id=filter2_f_1677_11483 x=-12 y=-44 width=100 height=100 filterUnits=userSpaceOnUse color-interpolation-filters=sRGB><feFlood flood-opacity=0 result=BackgroundImageFix /><feBlend mode=normal in=SourceGraphic in2=BackgroundImageFix result=shape /><feGaussianBlur stdDeviation=12 result=effect1_foregroundBlur_1677_11483 /></filter><filter id=filter3_f_1677_11483 x=13 y=19 width=100 height=100 filterUnits=userSpaceOnUse color-interpolation-filters=sRGB><feFlood flood-opacity=0 result=BackgroundImageFix /><feBlend mode=normal in=SourceGraphic in2=BackgroundImageFix result=shape /><feGaussianBlur stdDeviation=12 result=effect1_foregroundBlur_1677_11483 /></filter></defs><mask id=mask0_1677_11483 style=mask-type:alpha maskUnits=userSpaceOnUse x=16 y=14 width=58 height=62><path d="M21 25.3501C21.7279 25.3501 22.4195 25.5056 23.0433 25.7853L42.1439 14.8C43.0439 14.3 44.1439 14 45.1439 14C46.2439 14 47.2439 14.3 48.1439 14.8L64.5439 24.3C63.3439 25.1 62.4439 26.3 61.8439 27.7L45.9438 18.5C45.6439 18.3 45.344 18.3 45.0441 18.3C44.7441 18.3 44.4439 18.4 44.1439 18.5L25.8225 29.0251C25.9382 29.4471 26 29.8914 26 30.3501C26 33.1115 23.7614 35.3501 21 35.3501C18.2386 35.3501 16 33.1115 16 30.3501C16 27.5887 18.2386 25.3501 21 25.3501Z" fill=url(#paint3_linear_1677_11483) /><path d="M67.2438 35.0329C65.3487 34.3219 64 32.4934 64 30.35C64 27.5886 66.2386 25.35 69 25.35C71.7614 25.35 74 27.5886 74 30.35C74 32.1825 73.0142 33.7848 71.5439 34.6554V55.2C71.5439 57.4 70.3439 59.4 68.5439 60.5L52.1439 69.9C52.1439 68.4 51.6438 66.9 50.7438 65.8L66.3439 56.8C66.9439 56.5 67.2438 55.9 67.2438 55.2V35.0329Z" fill=url(#paint4_linear_1677_11483) /><path d="M49.8439 69.1055C49.9458 69.5034 50 69.9204 50 70.3501C50 73.1115 47.7614 75.3501 45 75.3501C42.5102 75.3501 40.4454 73.5302 40.0633 71.1481L21.8439 60.6C19.9439 59.5 18.8439 57.5 18.8439 55.3V36.8C19.5439 37 20.3439 37.2 21.0439 37.2C21.7439 37.2 22.4439 37.1 23.0439 36.9V55.3C23.0439 56 23.4438 56.6 23.9438 56.9L41.3263 66.9583C42.2398 65.9694 43.5476 65.3501 45 65.3501C47.3291 65.3501 49.2862 66.9426 49.8419 69.0981L49.8436 69.0997L49.8439 69.1055Z" fill=url(#paint5_linear_1677_11483) /></mask><mask id=mask1_1677_11483 style=mask-type:alpha maskUnits=userSpaceOnUse x=30 y=28 width=30 height=30><path fill-rule=evenodd clip-rule=evenodd d="M49.3945 32.3945C49.3945 34.7088 47.5796 38.5469 45 38.5469C42.4271 38.5469 40.6055 34.7112 40.6055 32.3945C40.6055 29.9714 42.5769 28 45 28C47.4231 28 49.3945 29.9714 49.3945 32.3945ZM35.332 49.0433V48.2148C35.332 42.8117 37.8535 41.0004 39.8796 39.545L39.8801 39.5447C40.3928 39.1767 40.8604 38.8404 41.2488 38.4742C42.3293 39.6642 43.626 40.3047 45 40.3047C46.3752 40.3047 47.6725 39.6642 48.7529 38.4754C49.1408 38.841 49.6078 39.1773 50.1199 39.5447L50.1204 39.545C52.1465 41.0004 54.668 42.8117 54.668 48.2148V49.0433L53.8406 49.092C49.9848 49.3185 46.8646 46.9002 45 43.5777C43.1159 46.935 39.9847 49.318 36.1594 49.092L35.332 49.0433ZM58.1463 51.0747L58.1463 51.0746C57.0179 50.891 50.0128 49.7507 45.0007 55.693C40.0116 49.7553 33.1965 50.8592 31.9095 51.0677L31.9095 51.0677C31.7906 51.087 31.7189 51.0986 31.7002 51.0963C31.7005 51.0969 31.7011 51.1045 31.7023 51.1187C31.726 51.4003 31.9682 54.2745 34.0566 56.2422L30 58H60L55.8956 56.2422C57.8537 54.4764 58.1396 52.2685 58.2508 51.4092V51.4091C58.2697 51.2628 58.2836 51.1556 58.2998 51.0963C58.2881 51.0977 58.2356 51.0892 58.1463 51.0747ZM40.4836 50.104C42.3956 49.3212 43.6746 48.1737 45 46.61C46.332 48.1841 47.6159 49.3259 49.5164 50.104C49.5356 50.1425 49.5557 50.1805 49.5756 50.2182C49.5793 50.2253 49.583 50.2323 49.5867 50.2393C48.0911 50.8127 46.4264 51.825 45.0047 53.1444C43.5906 51.8221 41.9673 50.8196 40.4256 50.2153C40.4455 50.1784 40.4648 50.1415 40.4836 50.104Z" fill=black /></mask><path d="M 40.59 93.095 C 46.517 93.095 52.14 94.365 57.22 96.635 L 212.7 7.22 C 220.025 3.149 228.978 0.706 237.12 0.706 C 246.073 0.706 254.213 3.149 261.54 7.22 L 395.032 84.547 C 385.264 91.059 377.939 100.827 373.055 112.224 L 243.631 37.338 C 241.19 35.71 238.747 35.71 236.305 35.71 C 233.863 35.71 231.42 36.523 228.978 37.338 L 79.84 123.009 C 80.786 126.443 81.29 130.058 81.29 133.793 C 81.29 156.269 63.065 174.493 40.59 174.493 C 18.116 174.493 -0.109 156.269 -0.109 133.793 C -0.109 111.32 18.116 93.095 40.59 93.095 Z" fill=url(#paint0_linear_1677_11483) /><path d="M 417.01 171.913 C 401.585 166.126 390.603 151.238 390.603 133.793 C 390.603 111.32 408.83 93.095 431.303 93.095 C 453.777 93.095 472.001 111.32 472.001 133.793 C 472.001 148.706 463.976 161.755 452.011 168.835 L 452.011 336.07 C 452.011 353.977 442.243 370.258 427.591 379.21 L 294.098 455.726 C 294.098 443.516 290.029 431.306 282.703 422.353 L 409.683 349.093 C 414.568 346.651 417.01 341.767 417.01 336.07 L 417.01 171.913 Z" fill=url(#paint1_linear_1677_11483) /><path d="M 275.376 449.253 C 276.206 452.495 276.646 455.889 276.646 459.389 C 276.646 481.863 258.422 500.087 235.947 500.087 C 215.679 500.087 198.87 485.272 195.761 465.883 L 47.46 380.025 C 31.995 371.071 23.041 354.792 23.041 336.884 L 23.041 186.296 C 28.738 187.923 35.25 189.553 40.948 189.553 C 46.646 189.553 52.345 188.738 57.228 187.111 L 57.228 336.884 C 57.228 342.582 60.485 347.465 64.554 349.908 L 206.042 431.777 C 213.481 423.728 224.127 418.689 235.947 418.689 C 254.905 418.689 270.833 431.656 275.36 449.196 L 275.376 449.214 L 275.376 449.253 Z" fill=url(#paint2_linear_1677_11483) /><g mask=url(#mask0_1677_11483) transform="matrix(8.139854, 0, 0, 8.139854, -130.346375, -113.251038)"><g filter=url(#filter0_f_1677_11483)><circle cx=73 cy=25 r=26 fill=#ED2E7E /></g><g filter=url(#filter1_f_1677_11483)><circle cx=26 cy=69 r=26 fill=#1CC8EE /></g></g><path fill-rule=evenodd clip-rule=evenodd d="M 271.713 150.431 C 271.713 169.275 256.948 200.517 235.947 200.517 C 215.003 200.517 200.172 169.292 200.172 150.431 C 200.172 130.708 216.225 114.666 235.947 114.666 C 255.67 114.666 271.713 130.708 271.713 150.431 Z M 157.251 285.952 L 157.251 279.212 C 157.251 235.233 177.771 220.485 194.27 208.641 C 198.447 205.644 202.247 202.901 205.414 199.923 C 214.204 209.608 224.763 214.826 235.947 214.826 C 247.138 214.826 257.697 209.608 266.496 199.931 C 269.653 202.911 273.456 205.644 277.622 208.641 C 294.114 220.485 314.642 235.233 314.642 279.212 L 314.642 285.952 L 307.912 286.351 C 276.525 288.191 251.128 268.509 235.947 241.468 C 220.611 268.795 195.126 288.191 163.981 286.351 L 157.251 285.952 Z M 342.953 302.492 C 333.771 300.994 276.751 291.715 235.955 340.082 C 195.345 291.749 139.865 300.734 129.389 302.436 C 128.428 302.59 127.841 302.688 127.687 302.665 C 127.687 302.673 127.695 302.729 127.702 302.85 C 127.897 305.138 129.867 328.532 146.872 344.55 L 113.849 358.862 L 358.044 358.862 L 324.639 344.55 C 340.576 330.177 342.905 312.202 343.807 305.212 C 343.962 304.022 344.077 303.153 344.206 302.665 C 344.108 302.68 343.686 302.606 342.953 302.492 Z M 199.188 294.59 C 214.751 288.215 225.161 278.879 235.947 266.15 C 246.788 278.96 257.241 288.255 272.707 294.59 C 272.869 294.898 273.031 295.207 273.196 295.518 C 273.219 295.574 273.252 295.631 273.285 295.688 C 261.107 300.361 247.555 308.598 235.989 319.334 C 224.477 308.573 211.258 300.417 198.715 295.493 C 198.87 295.191 199.033 294.891 199.188 294.59 Z" fill=url(#paint6_linear_1677_11483) /><g mask=url(#mask1_1677_11483) transform="matrix(8.139854, 0, 0, 8.139854, -130.346375, -113.251038)"><g filter=url(#filter2_f_1677_11483)><circle cx=38 cy=6 r=26 fill=#ED2E7E /></g><g filter=url(#filter3_f_1677_11483)><circle cx=63 cy=69 r=26 fill=#1CC8EE /></g></g></svg></div><h1>GraphQL Yoga</h1></div><h2>The batteries-included cross-platform GraphQL Server.</h2><div class=buttons><a href=https://www.the-guild.dev/graphql/yoga-server/docs class=docs>Read the Docs</a> <a href=https://www.the-guild.dev/graphql/yoga-server/tutorial/basic class=tutorial>Start the Tutorial </a><a href=__GRAPHIQL_LINK__ class=graphiql>Visit GraphiQL</a></div></section><section class=not-what-your-looking-for><h2>Not the page you are looking for? 👀</h2><p>This page is shown be default whenever a 404 is hit.<br>You can disable this by behavior via the <code>landingPage</code> option.</p><pre>
          <code>
import { createYoga } from 'graphql-yoga';

const yoga = createYoga({
  landingPage: false
})
          </code>
        </pre><p>If you expected this page to be the GraphQL route, you need to configure Yoga. Currently, the GraphQL route is configured to be on <code>__GRAPHIQL_LINK__</code>.</p><pre>
          <code>
import { createYoga } from 'graphql-yoga';

const yoga = createYoga({
  graphqlEndpoint: '__REQUEST_PATH__',
})
          </code>
        </pre></section></main></body></html>`;
function useUnhandledRoute(args) {
  let urlPattern;
  function getUrlPattern({ URLPattern: URLPattern2 }) {
    urlPattern || (urlPattern = new URLPattern2({
      pathname: args.graphqlEndpoint
    }));
    return urlPattern;
  }
  return {
    onRequest({ request, fetchAPI, endResponse: endResponse2, url }) {
      var _a, _b2;
      if (!request.url.endsWith(args.graphqlEndpoint) && !request.url.endsWith(`${args.graphqlEndpoint}/`) && url.pathname !== args.graphqlEndpoint && url.pathname !== `${args.graphqlEndpoint}/` && !getUrlPattern(fetchAPI).test(url)) {
        if (args.showLandingPage === true && request.method === "GET" && !!((_b2 = (_a = request.headers) == null ? void 0 : _a.get("accept")) == null ? void 0 : _b2.includes("text/html"))) {
          endResponse2(new fetchAPI.Response(landingPageBody.replace(/__GRAPHIQL_LINK__/g, args.graphqlEndpoint).replace(/__REQUEST_PATH__/g, url.pathname), {
            status: 200,
            statusText: "OK",
            headers: {
              "Content-Type": "text/html"
            }
          }));
          return;
        }
        endResponse2(new fetchAPI.Response("", {
          status: 404,
          statusText: "Not Found"
        }));
      }
    }
  };
}
async function processResult({ request, result, fetchAPI, onResultProcessHooks }) {
  let resultProcessor;
  const acceptableMediaTypes = [];
  let acceptedMediaType = "*/*";
  for (const onResultProcessHook of onResultProcessHooks) {
    await onResultProcessHook({
      request,
      acceptableMediaTypes,
      result,
      setResult(newResult) {
        result = newResult;
      },
      resultProcessor,
      setResultProcessor(newResultProcessor, newAcceptedMimeType) {
        resultProcessor = newResultProcessor;
        acceptedMediaType = newAcceptedMimeType;
      }
    });
  }
  if (!resultProcessor) {
    return new fetchAPI.Response(null, {
      status: 406,
      statusText: "Not Acceptable",
      headers: {
        accept: acceptableMediaTypes.join("; charset=utf-8, ")
      }
    });
  }
  return resultProcessor(result, fetchAPI, acceptedMediaType);
}
async function processRequest({ params, enveloped }) {
  const document = enveloped.parse(params.query);
  const errors = enveloped.validate(enveloped.schema, document);
  if (errors.length > 0) {
    return { errors };
  }
  const contextValue = await enveloped.contextFactory();
  const executionArgs = {
    schema: enveloped.schema,
    document,
    contextValue,
    variableValues: params.variables,
    operationName: params.operationName
  };
  const operation = getOperationAST(document, params.operationName);
  const executeFn = (operation == null ? void 0 : operation.operation) === "subscription" ? enveloped.subscribe : enveloped.execute;
  return executeFn(executionArgs);
}
const maskError = (error, message, isDev2 = ((_g) => (_g = ((_f) => (_f = globalThis.process) == null ? void 0 : _f.env)()) == null ? void 0 : _g.NODE_ENV)() === "development") => {
  if (isGraphQLError$1(error)) {
    if (error.originalError) {
      if (error.originalError.name === "GraphQLError") {
        return error;
      }
      const extensions = {
        ...error.extensions,
        unexpected: true
      };
      if (isDev2) {
        extensions.originalError = {
          message: error.originalError.message,
          stack: error.originalError.stack
        };
      }
      return createGraphQLError(message, {
        nodes: error.nodes,
        source: error.source,
        positions: error.positions,
        path: error.path,
        extensions
      });
    }
    return error;
  }
  return createGraphQLError(message, {
    extensions: {
      unexpected: true,
      originalError: isDev2 ? error instanceof Error ? {
        message: error.message,
        stack: error.stack
      } : error : void 0
    }
  });
};
class YogaServer {
  constructor(options) {
    /**
     * Instance of envelop
     */
    __publicField(this, "getEnveloped");
    __publicField(this, "logger");
    __publicField(this, "graphqlEndpoint");
    __publicField(this, "fetchAPI");
    __publicField(this, "plugins");
    __publicField(this, "onRequestParseHooks");
    __publicField(this, "onParamsHooks");
    __publicField(this, "onResultProcessHooks");
    __publicField(this, "maskedErrorsOpts");
    __publicField(this, "id");
    __publicField(this, "handle", async (request, serverContext) => {
      let url = new Proxy({}, {
        get: (_target, prop, _receiver) => {
          url = new this.fetchAPI.URL(request.url, "http://localhost");
          return Reflect.get(url, prop, url);
        }
      });
      let requestParser;
      const onRequestParseDoneList = [];
      for (const onRequestParse of this.onRequestParseHooks) {
        const onRequestParseResult = await onRequestParse({
          request,
          url,
          requestParser,
          serverContext,
          setRequestParser(parser) {
            requestParser = parser;
          }
        });
        if ((onRequestParseResult == null ? void 0 : onRequestParseResult.onRequestParseDone) != null) {
          onRequestParseDoneList.push(onRequestParseResult.onRequestParseDone);
        }
      }
      this.logger.debug(`Parsing request to extract GraphQL parameters`);
      if (!requestParser) {
        return new this.fetchAPI.Response(null, {
          status: 415,
          statusText: "Unsupported Media Type"
        });
      }
      let requestParserResult = await requestParser(request);
      for (const onRequestParseDone of onRequestParseDoneList) {
        await onRequestParseDone({
          requestParserResult,
          setRequestParserResult(newParams) {
            requestParserResult = newParams;
          }
        });
      }
      const result = await (Array.isArray(requestParserResult) ? Promise.all(requestParserResult.map((params) => this.getResultForParams({
        params,
        request,
        batched: true
      }, serverContext))) : this.getResultForParams({
        params: requestParserResult,
        request,
        batched: false
      }, serverContext));
      return processResult({
        request,
        result,
        fetchAPI: this.fetchAPI,
        onResultProcessHooks: this.onResultProcessHooks
      });
    });
    this.id = (options == null ? void 0 : options.id) ?? "yoga";
    this.fetchAPI = {
      ...defaultFetchAPI
    };
    if (options == null ? void 0 : options.fetchAPI) {
      for (const key in options.fetchAPI) {
        if (options.fetchAPI[key]) {
          this.fetchAPI[key] = options.fetchAPI[key];
        }
      }
    }
    const logger = (options == null ? void 0 : options.logging) == null ? true : options.logging;
    this.logger = typeof logger === "boolean" ? logger === true ? createLogger() : createLogger("silent") : typeof logger === "string" ? createLogger(logger) : logger;
    const maskErrorFn = typeof (options == null ? void 0 : options.maskedErrors) === "object" && options.maskedErrors.maskError || maskError;
    const maskedErrorSet = /* @__PURE__ */ new WeakSet();
    this.maskedErrorsOpts = (options == null ? void 0 : options.maskedErrors) === false ? null : {
      errorMessage: "Unexpected error.",
      ...typeof (options == null ? void 0 : options.maskedErrors) === "object" ? options.maskedErrors : {},
      maskError: (error, message) => {
        var _a;
        if (maskedErrorSet.has(error)) {
          return error;
        }
        const newError = maskErrorFn(error, message, (_a = this.maskedErrorsOpts) == null ? void 0 : _a.isDev);
        if (newError !== error) {
          this.logger.error(error);
        }
        maskedErrorSet.add(newError);
        return newError;
      }
    };
    const maskedErrors = this.maskedErrorsOpts == null ? null : this.maskedErrorsOpts;
    let batchingLimit = 0;
    if (options == null ? void 0 : options.batching) {
      if (typeof options.batching === "boolean") {
        batchingLimit = 10;
      } else {
        batchingLimit = options.batching.limit ?? 10;
      }
    }
    this.graphqlEndpoint = (options == null ? void 0 : options.graphqlEndpoint) || "/graphql";
    const graphqlEndpoint = this.graphqlEndpoint;
    this.plugins = [
      useEngine({
        parse,
        validate,
        execute: normalizedExecutor,
        subscribe: normalizedExecutor,
        specifiedRules
      }),
      // Use the schema provided by the user
      !!(options == null ? void 0 : options.schema) && useSchema(options.schema),
      (options == null ? void 0 : options.context) != null && useExtendContext((initialContext) => {
        if (options == null ? void 0 : options.context) {
          if (typeof options.context === "function") {
            return options.context(initialContext);
          }
          return options.context;
        }
        return {};
      }),
      // Middlewares before processing the incoming HTTP request
      useHealthCheck({
        id: this.id,
        logger: this.logger,
        endpoint: options == null ? void 0 : options.healthCheckEndpoint
      }),
      (options == null ? void 0 : options.cors) !== false && useCORS(options == null ? void 0 : options.cors),
      (options == null ? void 0 : options.graphiql) !== false && useGraphiQL({
        graphqlEndpoint,
        options: options == null ? void 0 : options.graphiql,
        render: options == null ? void 0 : options.renderGraphiQL,
        logger: this.logger
      }),
      // Middlewares before the GraphQL execution
      useRequestParser({
        match: isGETRequest,
        parse: parseGETRequest
      }),
      useRequestParser({
        match: isPOSTJsonRequest,
        parse: parsePOSTJsonRequest
      }),
      (options == null ? void 0 : options.multipart) !== false && useRequestParser({
        match: isPOSTMultipartRequest,
        parse: parsePOSTMultipartRequest
      }),
      useRequestParser({
        match: isPOSTGraphQLStringRequest,
        parse: parsePOSTGraphQLStringRequest
      }),
      useRequestParser({
        match: isPOSTFormUrlEncodedRequest,
        parse: parsePOSTFormUrlEncodedRequest
      }),
      // Middlewares after the GraphQL execution
      useResultProcessors(),
      useErrorHandling((error, request) => {
        const errors = handleError(error, this.maskedErrorsOpts, this.logger);
        const result = {
          errors
        };
        return processResult({
          request,
          result,
          fetchAPI: this.fetchAPI,
          onResultProcessHooks: this.onResultProcessHooks
        });
      }),
      ...(options == null ? void 0 : options.plugins) ?? [],
      // To make sure those are called at the end
      {
        onPluginInit({ addPlugin }) {
          if ((options == null ? void 0 : options.parserAndValidationCache) !== false) {
            addPlugin(
              // @ts-expect-error Add plugins has context but this hook doesn't care
              useParserAndValidationCache(!(options == null ? void 0 : options.parserAndValidationCache) || (options == null ? void 0 : options.parserAndValidationCache) === true ? {} : options == null ? void 0 : options.parserAndValidationCache)
            );
          }
          addPlugin(useLimitBatching(batchingLimit));
          addPlugin(useCheckGraphQLQueryParams());
          addPlugin(
            // @ts-expect-error Add plugins has context but this hook doesn't care
            useUnhandledRoute({
              graphqlEndpoint,
              showLandingPage: (options == null ? void 0 : options.landingPage) ?? true
            })
          );
          addPlugin(useCheckMethodForGraphQL());
          addPlugin(usePreventMutationViaGET());
          if (maskedErrors) {
            addPlugin(useMaskedErrors(maskedErrors));
          }
          addPlugin(
            // We handle validation errors at the end
            useHTTPValidationError()
          );
        }
      }
    ];
    this.getEnveloped = envelop({
      plugins: this.plugins
    });
    this.plugins = this.getEnveloped._plugins;
    this.onRequestParseHooks = [];
    this.onParamsHooks = [];
    this.onResultProcessHooks = [];
    for (const plugin of this.plugins) {
      if (plugin) {
        if (plugin.onYogaInit) {
          plugin.onYogaInit({
            yoga: this
          });
        }
        if (plugin.onRequestParse) {
          this.onRequestParseHooks.push(plugin.onRequestParse);
        }
        if (plugin.onParams) {
          this.onParamsHooks.push(plugin.onParams);
        }
        if (plugin.onResultProcess) {
          this.onResultProcessHooks.push(plugin.onResultProcess);
        }
      }
    }
  }
  async getResultForParams({ params, request, batched }, ...args) {
    var _a;
    try {
      let result;
      for (const onParamsHook of this.onParamsHooks) {
        await onParamsHook({
          params,
          request,
          setParams(newParams) {
            params = newParams;
          },
          setResult(newResult) {
            result = newResult;
          },
          fetchAPI: this.fetchAPI
        });
      }
      if (result == null) {
        const additionalContext = ((_a = args[0]) == null ? void 0 : _a.request) ? {
          params
        } : {
          request,
          params
        };
        const initialContext = args[0] ? batched ? Object.assign({}, args[0], additionalContext) : Object.assign(args[0], additionalContext) : additionalContext;
        const enveloped = this.getEnveloped(initialContext);
        this.logger.debug(`Processing GraphQL Parameters`);
        result = await processRequest({
          params,
          enveloped
        });
        this.logger.debug(`Processing GraphQL Parameters done.`);
      }
      return result;
    } catch (error) {
      const errors = handleError(error, this.maskedErrorsOpts, this.logger);
      const result = {
        errors
      };
      return result;
    }
  }
}
function createYoga(options) {
  const server = new YogaServer(options);
  return createServerAdapter(server, {
    fetchAPI: server.fetchAPI,
    plugins: server["plugins"]
  });
}
const blockFieldSuggestionsDefaultOptions = {
  mask: "[Suggestion hidden]"
};
const formatter = (error, mask) => {
  if (error instanceof GraphQLError) {
    error.message = error.message.replace(/Did you mean ".+"/g, mask);
  }
  return error;
};
const blockFieldSuggestionsPlugin = (options) => {
  var _options$mask;
  const mask = (_options$mask = options === null || options === void 0 ? void 0 : options.mask) !== null && _options$mask !== void 0 ? _options$mask : blockFieldSuggestionsDefaultOptions.mask;
  return {
    onValidate: () => {
      return function onValidateEnd({
        valid,
        result,
        setResult
      }) {
        if (!valid) {
          setResult(result.map((error) => formatter(error, mask)));
        }
      };
    }
  };
};
function DeferStreamDirectiveLabelRule(context) {
  const knownLabels = /* @__PURE__ */ Object.create(null);
  return {
    Directive(node) {
      var _a;
      if (node.name.value === GraphQLDeferDirective.name || node.name.value === GraphQLStreamDirective.name) {
        const labelArgument = (_a = node.arguments) == null ? void 0 : _a.find((arg) => arg.name.value === "label");
        const labelValue = labelArgument == null ? void 0 : labelArgument.value;
        if (!labelValue) {
          return;
        }
        if (labelValue.kind !== Kind.STRING) {
          context.reportError(createGraphQLError(`Directive "${node.name.value}"'s label argument must be a static string.`, { nodes: node }));
        } else if (knownLabels[labelValue.value]) {
          context.reportError(createGraphQLError("Defer/Stream directive label argument must be unique.", {
            nodes: [knownLabels[labelValue.value], node]
          }));
        } else {
          knownLabels[labelValue.value] = node;
        }
      }
    }
  };
}
function DeferStreamDirectiveOnRootFieldRule(context) {
  return {
    Directive(node) {
      const mutationType = context.getSchema().getMutationType();
      const subscriptionType = context.getSchema().getSubscriptionType();
      const parentType = context.getParentType();
      if (parentType && node.name.value === GraphQLDeferDirective.name) {
        if (mutationType && parentType === mutationType) {
          context.reportError(createGraphQLError(`Defer directive cannot be used on root mutation type "${parentType.name}".`, { nodes: node }));
        }
        if (subscriptionType && parentType === subscriptionType) {
          context.reportError(createGraphQLError(`Defer directive cannot be used on root subscription type "${parentType.name}".`, { nodes: node }));
        }
      }
      if (parentType && node.name.value === GraphQLStreamDirective.name) {
        if (mutationType && parentType === mutationType) {
          context.reportError(createGraphQLError(`Stream directive cannot be used on root mutation type "${parentType.name}".`, { nodes: node }));
        }
        if (subscriptionType && parentType === subscriptionType) {
          context.reportError(createGraphQLError(`Stream directive cannot be used on root subscription type "${parentType.name}".`, { nodes: node }));
        }
      }
    }
  };
}
function naturalCompare(aStr, bStr) {
  let aIndex = 0;
  let bIndex = 0;
  while (aIndex < aStr.length && bIndex < bStr.length) {
    let aChar = aStr.charCodeAt(aIndex);
    let bChar = bStr.charCodeAt(bIndex);
    if (isDigit(aChar) && isDigit(bChar)) {
      let aNum = 0;
      do {
        ++aIndex;
        aNum = aNum * 10 + aChar - DIGIT_0;
        aChar = aStr.charCodeAt(aIndex);
      } while (isDigit(aChar) && aNum > 0);
      let bNum = 0;
      do {
        ++bIndex;
        bNum = bNum * 10 + bChar - DIGIT_0;
        bChar = bStr.charCodeAt(bIndex);
      } while (isDigit(bChar) && bNum > 0);
      if (aNum < bNum) {
        return -1;
      }
      if (aNum > bNum) {
        return 1;
      }
    } else {
      if (aChar < bChar) {
        return -1;
      }
      if (aChar > bChar) {
        return 1;
      }
      ++aIndex;
      ++bIndex;
    }
  }
  return aStr.length - bStr.length;
}
const DIGIT_0 = 48;
const DIGIT_9 = 57;
function isDigit(code) {
  return !Number.isNaN(code) && DIGIT_0 <= code && code <= DIGIT_9;
}
function sortValueNode(valueNode) {
  switch (valueNode.kind) {
    case Kind.OBJECT:
      return {
        ...valueNode,
        fields: sortFields(valueNode.fields)
      };
    case Kind.LIST:
      return {
        ...valueNode,
        values: valueNode.values.map(sortValueNode)
      };
    case Kind.INT:
    case Kind.FLOAT:
    case Kind.STRING:
    case Kind.BOOLEAN:
    case Kind.NULL:
    case Kind.ENUM:
    case Kind.VARIABLE:
      return valueNode;
  }
}
function sortFields(fields) {
  return fields.map((fieldNode) => ({
    ...fieldNode,
    value: sortValueNode(fieldNode.value)
  })).sort((fieldA, fieldB) => naturalCompare(fieldA.name.value, fieldB.name.value));
}
function reasonMessage(reason) {
  if (Array.isArray(reason)) {
    return reason.map(([responseName, subReason]) => `subfields "${responseName}" conflict because ` + reasonMessage(subReason)).join(" and ");
  }
  return reason;
}
function OverlappingFieldsCanBeMergedRule(context) {
  const comparedFragmentPairs = new PairSet();
  const cachedFieldsAndFragmentNames = /* @__PURE__ */ new Map();
  return {
    SelectionSet(selectionSet) {
      const conflicts = findConflictsWithinSelectionSet(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, context.getParentType(), selectionSet);
      for (const [[responseName, reason], fields1, fields2] of conflicts) {
        const reasonMsg = reasonMessage(reason);
        context.reportError(createGraphQLError(`Fields "${responseName}" conflict because ${reasonMsg}. Use different aliases on the fields to fetch both if this was intentional.`, { nodes: fields1.concat(fields2) }));
      }
    }
  };
}
function findConflictsWithinSelectionSet(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, parentType, selectionSet) {
  const conflicts = [];
  const [fieldMap, fragmentNames] = getFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, parentType, selectionSet);
  collectConflictsWithin(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, fieldMap);
  if (fragmentNames.length !== 0) {
    for (let i = 0; i < fragmentNames.length; i++) {
      collectConflictsBetweenFieldsAndFragment(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, false, fieldMap, fragmentNames[i]);
      for (let j = i + 1; j < fragmentNames.length; j++) {
        collectConflictsBetweenFragments(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, false, fragmentNames[i], fragmentNames[j]);
      }
    }
  }
  return conflicts;
}
function collectConflictsBetweenFieldsAndFragment(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap, fragmentName) {
  const fragment = context.getFragment(fragmentName);
  if (!fragment) {
    return;
  }
  const [fieldMap2, referencedFragmentNames] = getReferencedFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, fragment);
  if (fieldMap === fieldMap2) {
    return;
  }
  collectConflictsBetween(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap, fieldMap2);
  for (const referencedFragmentName of referencedFragmentNames) {
    if (comparedFragmentPairs.has(referencedFragmentName, fragmentName, areMutuallyExclusive)) {
      continue;
    }
    comparedFragmentPairs.add(referencedFragmentName, fragmentName, areMutuallyExclusive);
    collectConflictsBetweenFieldsAndFragment(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap, referencedFragmentName);
  }
}
function collectConflictsBetweenFragments(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fragmentName1, fragmentName2) {
  if (fragmentName1 === fragmentName2) {
    return;
  }
  if (comparedFragmentPairs.has(fragmentName1, fragmentName2, areMutuallyExclusive)) {
    return;
  }
  comparedFragmentPairs.add(fragmentName1, fragmentName2, areMutuallyExclusive);
  const fragment1 = context.getFragment(fragmentName1);
  const fragment2 = context.getFragment(fragmentName2);
  if (!fragment1 || !fragment2) {
    return;
  }
  const [fieldMap1, referencedFragmentNames1] = getReferencedFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, fragment1);
  const [fieldMap2, referencedFragmentNames2] = getReferencedFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, fragment2);
  collectConflictsBetween(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap1, fieldMap2);
  for (const referencedFragmentName2 of referencedFragmentNames2) {
    collectConflictsBetweenFragments(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fragmentName1, referencedFragmentName2);
  }
  for (const referencedFragmentName1 of referencedFragmentNames1) {
    collectConflictsBetweenFragments(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, referencedFragmentName1, fragmentName2);
  }
}
function findConflictsBetweenSubSelectionSets(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, parentType1, selectionSet1, parentType2, selectionSet2) {
  const conflicts = [];
  const [fieldMap1, fragmentNames1] = getFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, parentType1, selectionSet1);
  const [fieldMap2, fragmentNames2] = getFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, parentType2, selectionSet2);
  collectConflictsBetween(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap1, fieldMap2);
  for (const fragmentName2 of fragmentNames2) {
    collectConflictsBetweenFieldsAndFragment(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap1, fragmentName2);
  }
  for (const fragmentName1 of fragmentNames1) {
    collectConflictsBetweenFieldsAndFragment(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fieldMap2, fragmentName1);
  }
  for (const fragmentName1 of fragmentNames1) {
    for (const fragmentName2 of fragmentNames2) {
      collectConflictsBetweenFragments(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, fragmentName1, fragmentName2);
    }
  }
  return conflicts;
}
function collectConflictsWithin(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, fieldMap) {
  for (const [responseName, fields] of Object.entries(fieldMap)) {
    if (fields.length > 1) {
      for (let i = 0; i < fields.length; i++) {
        for (let j = i + 1; j < fields.length; j++) {
          const conflict = findConflict(
            context,
            cachedFieldsAndFragmentNames,
            comparedFragmentPairs,
            false,
            // within one collection is never mutually exclusive
            responseName,
            fields[i],
            fields[j]
          );
          if (conflict) {
            conflicts.push(conflict);
          }
        }
      }
    }
  }
}
function collectConflictsBetween(context, conflicts, cachedFieldsAndFragmentNames, comparedFragmentPairs, parentFieldsAreMutuallyExclusive, fieldMap1, fieldMap2) {
  for (const [responseName, fields1] of Object.entries(fieldMap1)) {
    const fields2 = fieldMap2[responseName];
    if (fields2) {
      for (const field1 of fields1) {
        for (const field2 of fields2) {
          const conflict = findConflict(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, parentFieldsAreMutuallyExclusive, responseName, field1, field2);
          if (conflict) {
            conflicts.push(conflict);
          }
        }
      }
    }
  }
}
function findConflict(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, parentFieldsAreMutuallyExclusive, responseName, field1, field2) {
  const [parentType1, node1, def1] = field1;
  const [parentType2, node2, def2] = field2;
  const areMutuallyExclusive = parentFieldsAreMutuallyExclusive || parentType1 !== parentType2 && isObjectType(parentType1) && isObjectType(parentType2);
  if (!areMutuallyExclusive) {
    const name1 = node1.name.value;
    const name2 = node2.name.value;
    if (name1 !== name2) {
      return [[responseName, `"${name1}" and "${name2}" are different fields`], [node1], [node2]];
    }
    if (stringifyArguments(node1) !== stringifyArguments(node2)) {
      return [[responseName, "they have differing arguments"], [node1], [node2]];
    }
  }
  const directives1 = (
    /* c8 ignore next */
    node1.directives ?? []
  );
  const directives2 = (
    /* c8 ignore next */
    node2.directives ?? []
  );
  if (!sameStreams(directives1, directives2)) {
    return [[responseName, "they have differing stream directives"], [node1], [node2]];
  }
  const type1 = def1 == null ? void 0 : def1.type;
  const type2 = def2 == null ? void 0 : def2.type;
  if (type1 && type2 && doTypesConflict(type1, type2)) {
    return [
      [responseName, `they return conflicting types "${inspect(type1)}" and "${inspect(type2)}"`],
      [node1],
      [node2]
    ];
  }
  const selectionSet1 = node1.selectionSet;
  const selectionSet2 = node2.selectionSet;
  if (selectionSet1 && selectionSet2) {
    const conflicts = findConflictsBetweenSubSelectionSets(context, cachedFieldsAndFragmentNames, comparedFragmentPairs, areMutuallyExclusive, getNamedType(type1), selectionSet1, getNamedType(type2), selectionSet2);
    return subfieldConflicts(conflicts, responseName, node1, node2);
  }
  return;
}
function stringifyArguments(fieldNode) {
  const args = (
    /* c8 ignore next */
    fieldNode.arguments ?? []
  );
  const inputObjectWithArgs = {
    kind: Kind.OBJECT,
    fields: args.map((argNode) => ({
      kind: Kind.OBJECT_FIELD,
      name: argNode.name,
      value: argNode.value
    }))
  };
  return print(sortValueNode(inputObjectWithArgs));
}
function getStreamDirective(directives) {
  return directives.find((directive) => directive.name.value === "stream");
}
function sameStreams(directives1, directives2) {
  const stream1 = getStreamDirective(directives1);
  const stream2 = getStreamDirective(directives2);
  if (!stream1 && !stream2) {
    return true;
  }
  if (stream1 && stream2) {
    return stringifyArguments(stream1) === stringifyArguments(stream2);
  }
  return false;
}
function doTypesConflict(type1, type2) {
  if (isListType(type1)) {
    return isListType(type2) ? doTypesConflict(type1.ofType, type2.ofType) : true;
  }
  if (isListType(type2)) {
    return true;
  }
  if (isNonNullType(type1)) {
    return isNonNullType(type2) ? doTypesConflict(type1.ofType, type2.ofType) : true;
  }
  if (isNonNullType(type2)) {
    return true;
  }
  if (isLeafType(type1) || isLeafType(type2)) {
    return type1 !== type2;
  }
  return false;
}
function getFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, parentType, selectionSet) {
  const cached = cachedFieldsAndFragmentNames.get(selectionSet);
  if (cached) {
    return cached;
  }
  const nodeAndDefs = /* @__PURE__ */ Object.create(null);
  const fragmentNames = /* @__PURE__ */ new Set();
  _collectFieldsAndFragmentNames(context, parentType, selectionSet, nodeAndDefs, fragmentNames);
  const result = [nodeAndDefs, [...fragmentNames]];
  cachedFieldsAndFragmentNames.set(selectionSet, result);
  return result;
}
function getReferencedFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, fragment) {
  const cached = cachedFieldsAndFragmentNames.get(fragment.selectionSet);
  if (cached) {
    return cached;
  }
  const fragmentType = typeFromAST(context.getSchema(), fragment.typeCondition);
  return getFieldsAndFragmentNames(context, cachedFieldsAndFragmentNames, fragmentType, fragment.selectionSet);
}
function _collectFieldsAndFragmentNames(context, parentType, selectionSet, nodeAndDefs, fragmentNames) {
  for (const selection of selectionSet.selections) {
    switch (selection.kind) {
      case Kind.FIELD: {
        const fieldName = selection.name.value;
        let fieldDef;
        if (isObjectType(parentType) || isInterfaceType(parentType)) {
          fieldDef = parentType.getFields()[fieldName];
        }
        const responseName = selection.alias ? selection.alias.value : fieldName;
        nodeAndDefs[responseName] || (nodeAndDefs[responseName] = []);
        nodeAndDefs[responseName].push([parentType, selection, fieldDef]);
        break;
      }
      case Kind.FRAGMENT_SPREAD:
        fragmentNames.add(selection.name.value);
        break;
      case Kind.INLINE_FRAGMENT: {
        const typeCondition = selection.typeCondition;
        const inlineFragmentType = typeCondition ? typeFromAST(context.getSchema(), typeCondition) : parentType;
        _collectFieldsAndFragmentNames(context, inlineFragmentType, selection.selectionSet, nodeAndDefs, fragmentNames);
        break;
      }
    }
  }
}
function subfieldConflicts(conflicts, responseName, node1, node2) {
  if (conflicts.length > 0) {
    return [
      [responseName, conflicts.map(([reason]) => reason)],
      [node1, ...conflicts.map(([, fields1]) => fields1).flat()],
      [node2, ...conflicts.map(([, , fields2]) => fields2).flat()]
    ];
  }
  return;
}
class PairSet {
  constructor() {
    __publicField(this, "_data");
    this._data = /* @__PURE__ */ new Map();
  }
  has(a, b, areMutuallyExclusive) {
    var _a;
    const [key1, key2] = a < b ? [a, b] : [b, a];
    const result = (_a = this._data.get(key1)) == null ? void 0 : _a.get(key2);
    if (result === void 0) {
      return false;
    }
    return areMutuallyExclusive ? true : areMutuallyExclusive === result;
  }
  add(a, b, areMutuallyExclusive) {
    const [key1, key2] = a < b ? [a, b] : [b, a];
    const map = this._data.get(key1);
    if (map === void 0) {
      this._data.set(key1, /* @__PURE__ */ new Map([[key2, areMutuallyExclusive]]));
    } else {
      map.set(key2, areMutuallyExclusive);
    }
  }
}
function StreamDirectiveOnListFieldRule(context) {
  return {
    Directive(node) {
      const fieldDef = context.getFieldDef();
      const parentType = context.getParentType();
      if (fieldDef && parentType && node.name.value === GraphQLStreamDirective.name && !(isListType(fieldDef.type) || isWrappingType(fieldDef.type) && isListType(fieldDef.type.ofType))) {
        context.reportError(createGraphQLError(`Stream directive cannot be used on non-list field "${fieldDef.name}" on type "${parentType.name}".`, { nodes: node }));
      }
    }
  };
}
function useDeferStream() {
  return {
    onSchemaChange: ({ schema, replaceSchema }) => {
      const directives = [];
      const deferInSchema = schema.getDirective("defer");
      if (deferInSchema == null) {
        directives.push(GraphQLDeferDirective);
      }
      const streamInSchema = schema.getDirective("stream");
      if (streamInSchema == null) {
        directives.push(GraphQLStreamDirective);
      }
      if (directives.length) {
        replaceSchema(new GraphQLSchema({
          ...schema.toConfig(),
          directives: [...schema.getDirectives(), ...directives]
        }));
      }
    },
    onValidate: ({ params, addValidationRule }) => {
      params.rules || (params.rules = []);
      params.rules = params.rules.filter((rule) => rule.name !== "OverlappingFieldsCanBeMergedRule");
      addValidationRule(OverlappingFieldsCanBeMergedRule);
      addValidationRule(DeferStreamDirectiveLabelRule);
      addValidationRule(DeferStreamDirectiveOnRootFieldRule);
      addValidationRule(StreamDirectiveOnListFieldRule);
    }
  };
}
const store = /* @__PURE__ */ new WeakMap();
const useDisableIntrospection = (props) => {
  return {
    async onRequest({ request }) {
      const isDisabled = (props == null ? void 0 : props.isDisabled) ? await props.isDisabled(request) : true;
      store.set(request, isDisabled);
    },
    onValidate({ addValidationRule, context }) {
      const isDisabled = store.get(context.request) ?? true;
      if (isDisabled) {
        addValidationRule(NoSchemaIntrospectionCustomRule);
      }
    }
  };
};
function createBlake3Hash(str) {
  let val = 0;
  const strlen = str.length;
  if (strlen === 0) {
    return val;
  }
  for (let i = 0; i < strlen; ++i) {
    const code = str.charCodeAt(i);
    val = (val << 5) - val + code;
    val &= val;
  }
  return val >>> 0;
}
function extractStellatePayload({
  headers,
  operation,
  method,
  start,
  operationName,
  errors,
  response,
  variables,
  responseHeaders,
  sendVariablesAsHash,
  hasSetCookie
}) {
  const forwardedFor = headers.get("x-forwarded-for");
  const ips = forwardedFor ? forwardedFor.split(",") : [];
  const vary = responseHeaders && responseHeaders.get("vary");
  let varyHash = void 0;
  if (vary && vary.length) {
    const varyHeaders = vary.split(",").map((headerName) => headerName && headerName.trim()).sort();
    const variedValues = varyHeaders.map((headerName) => {
      const headerValue = headerName && headers.get(headerName);
      return headerValue ? `${headerName}:${headerValue}` : void 0;
    }).filter(Boolean).join("\n");
    varyHash = createBlake3Hash(variedValues);
  }
  return {
    operation,
    operationName,
    variables: sendVariablesAsHash ? void 0 : variables,
    variableHash: sendVariablesAsHash ? createBlake3Hash(JSON.stringify(variables || {})) : void 0,
    method,
    elapsed: Date.now() - start,
    ip: ips[0] || headers.get("true-client-ip") || headers.get("x-real-ip") || void 0,
    hasSetCookie,
    referer: headers.get("referer") || void 0,
    userAgent: headers.get("user-agent") || void 0,
    statusCode: 200,
    errors,
    responseSize: JSON.stringify(response).length,
    responseHash: createBlake3Hash(JSON.stringify(response)),
    varyHash
  };
}
function warnFetch(fetch2) {
  if (typeof fetch2 !== "function") {
    console.warn(
      `Stellate logger plugin requires a fetch function to be provided as an option.`
    );
    return;
  }
}
var hostname = process.env.STELLATE_ENDPOINT === "local" || process.env.STELLATE_ENDPOINT === "staging" ? "stellate.dev" : "stellate.sh";
async function logRequest({
  fetch: fetchFn,
  payload,
  token,
  serviceName
}) {
  return fetchFn(`https://${serviceName}.${hostname}/log`, {
    method: "POST",
    body: JSON.stringify(payload),
    headers: {
      "Content-Type": "application/json",
      "Stellate-Logging-Token": token
    }
  });
}
var createStellateLoggerPlugin = (options) => {
  var _a;
  const shouldSyncSchema = (_a = options.schemaSyncing) != null ? _a : true;
  let timeout;
  return {
    onSchemaChange(opts) {
      if (shouldSyncSchema) {
        const apiSchema = opts.schema;
        const randomTimeout = Math.random() * 5e3;
        if (timeout)
          clearTimeout(timeout);
        timeout = setTimeout(async () => {
          timeout = null;
          try {
            const introspection = introspectionFromSchema(apiSchema);
            options.fetch(`https://${options.serviceName}.${hostname}/schema`, {
              method: "POST",
              body: JSON.stringify({
                schema: introspection
              }),
              headers: {
                "Content-Type": "application/json",
                "Stellate-Schema-Token": options.token
              }
            }).then(() => {
            }).catch(() => {
            });
          } catch (e) {
          }
        }, randomTimeout);
      }
    },
    onExecute(payload) {
      var _a2;
      const sendVariablesAsHash = (_a2 = options.sendVariablesAsHash) != null ? _a2 : true;
      const start = Date.now();
      return {
        async onExecuteDone({ result }) {
          if (isAsyncIterable$1(result)) {
            console.warn(
              `Stellate does not currently support logging incremental results.`
            );
            return;
          }
          const { headers, method } = payload.args.contextValue.request;
          if (headers.has("gcdn-request-id"))
            return;
          const stellatePayload = extractStellatePayload({
            headers,
            operation: print(payload.args.document),
            method,
            sendVariablesAsHash,
            start,
            operationName: payload.args.operationName,
            errors: result.errors,
            response: result
          });
          warnFetch(options.fetch);
          try {
            await logRequest({
              fetch: options.fetch,
              payload: stellatePayload,
              token: options.token,
              serviceName: options.serviceName
            });
          } catch (e) {
          }
        }
      };
    }
  };
};
var getYogaPlugins = (stellate) => {
  return [
    useDeferStream(),
    process.env.NODE_ENV === "production" && useDisableIntrospection(),
    process.env.NODE_ENV === "production" && blockFieldSuggestionsPlugin(),
    Boolean(process.env.NODE_ENV === "production" && stellate) && createStellateLoggerPlugin({
      serviceName: stellate.serviceName,
      token: stellate.loggingToken,
      fetch
    })
  ].filter(Boolean);
};
var wrappedContext = (context) => {
  return async (ct) => {
    const baseContext = {
      request: ct.request,
      headers: ct.request.headers,
      params: ct.params
    };
    if (typeof context === "function") {
      const userCtx = context(baseContext);
      if (userCtx.then) {
        const result = await userCtx;
        return {
          ...baseContext,
          ...result
        };
      }
      return {
        ...baseContext,
        ...userCtx
      };
    } else if (typeof context === "object") {
      return {
        ...baseContext,
        ...context
      };
    }
    return baseContext;
  };
};
async function main() {
  let ctx;
  const context = /* @__PURE__ */ Object.assign({});
  if (context["/_context.ts"]) {
    const mod = context["/_context.ts"];
    if (mod.getContext) {
      ctx = mod.getContext;
    }
  }
  const completedSchema = builder.toSchema({});
  const yoga = createYoga({
    graphiql: false,
    maskedErrors: true,
    schema: completedSchema,
    // We allow batching by default
    batching: true,
    context: wrappedContext(ctx),
    plugins: getYogaPlugins()
  });
  const server = require$$0$3.createServer(yoga);
  server.listen(process.env.PORT || 4e3);
}
main();
export {
  main
};
