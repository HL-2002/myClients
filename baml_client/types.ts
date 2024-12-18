/*************************************************************************************************

Welcome to Baml! To use this generated code, please run one of the following:

$ npm install @boundaryml/baml
$ yarn add @boundaryml/baml
$ pnpm add @boundaryml/baml

*************************************************************************************************/

// This file was generated by BAML: do not edit it. Instead, edit the BAML
// files and re-generate this code.
//
/* eslint-disable */
// tslint:disable
// @ts-nocheck
// biome-ignore format: autogenerated code
import { Image } from "@boundaryml/baml"

export interface Checked<T,CheckName extends string = string> {
    value: T,
    checks: Record<CheckName, Check>,
}

export interface Check {
    name: string,
    expr: string
    status: "succeeded" | "failed"
}

export function all_succeeded<CheckName extends string>(checks: Record<CheckName, Check>): boolean {
    return get_checks(checks).every(check => check.status === "succeeded")
}

export function get_checks<CheckName extends string>(checks: Record<CheckName, Check>): Check[] {
    return Object.values(checks)
}
export interface CarPolicy {
  emission_date: string
  valid_through: string
  client: string
  id: string
  insured: string
  age: number
  policy_id: string
  branch: string
  company: string
  producer?: string | null
  intermediary: string
  renewal: boolean
  coverage: number
  premium: number
  payment_method?: string | null
  initial_installment?: number | null
  installments?: number | null
  installment_amount?: number | null
  last_payment?: string | null
  receipt: string
  
}

export interface HealthPolicy {
  emission_date: string
  valid_through: string
  client: string
  id: string
  insured: string
  age: number
  policy_id: string
  branch: string
  company: string
  producer?: string | null
  intermediary: string
  renewal: boolean
  coverage: number
  premium: number
  payment_method?: string | null
  initial_installment?: number | null
  installments?: number | null
  installment_amount?: number | null
  last_payment?: string | null
  receipt: string
  
}

export interface Resume {
  name: string
  email: string
  experience: string[]
  skills: string[]
  
}
