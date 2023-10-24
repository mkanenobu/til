import Ajv from "ajv";
import { Validator } from "jsonschema";
import { jsonSchema } from "../src/main.ts";

const ajv = new Ajv();
const validator = new Validator();

const data = {
  filters: [
    {
      filterType: "dateRange",
      properties: {
        start: new Date().toISOString(),
        end: (() => {
          const d = new Date();
          d.setDate(d.getDate() + 1);
          return d.toISOString();
        })(),
      },
    },
  ],
};

// const valid = ajv.validate(JSON.stringify(jsonSchema), data);
// @ts-expect-error
const valid = validator.validate(data, jsonSchema);

console.log("isValid?", valid);
