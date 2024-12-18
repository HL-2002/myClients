class HealthPolicy {
    emission_date string @description(#"
        The date the policy was issued in DD/MM/YYYY format.
    "#)
    valid_through string @description(#"
        The date the policy is valid through in DD/MM/YYYY format.
    "#)
    client string @description(#"
        Full name of the person paying for the policy.
    "#)
    id string @description(#"
        The client ID.
    "#)
    insured string @description(#"
        Full name of the person insured by the policy, if not specified, it's the same as the client.
    "#)
    age int @description(#"
        The age of the insured person.
    "#)
    policy_id string @description(#"
        The policy id.
    "#) 
    branch string @description(#"
        The branch of the insurance policy, like HCM Individual or Global Benefists.
    "#)
    company string @description(#"
        The name of the insurance company.
    "#)
    producer string?
    intermediary string @description(#"
        The name of the intermediary.
    "#)
    renewal bool @description(#"
        True if the policy is being renewed, false if it's new.
    "#)
    coverage float @description(#"
        The amount of coverage provided by the policy.
    "#)
    premium float @description(#"
        The premium amount for the policy.
    "#)
    payment_method string? @description(#"
        The method of payment for the policy, either full or N installments.
    "#)
    initial_installment float? @description(#"
        The initial installment amount for the policy, only if specified.
    "#)
    installments int? @description(#"
        The number of installments for the policy, 2 for semestral, 4 for trimestral, 12 for monthly.
    "#)
    installment_amount float? @description(#"
        The amount of each installment for the policy, present as the amount to charge.
    "#) 
    last_payment string? @description(#"
        The date of the last payment in DD/MM/YYYY format, only if specified.
    "#)
    receipt string @description(#"
        The receipt number for the policy.
    "#)
}

function ExtractHealthPolicy(policy: image) -> HealthPolicy {
    client "google-ai/gemini-1.5-flash"
    prompt #"
        {{_.role("user")}}

        Extract from this content:
        {{ policy }}

        {{ ctx.output_format }}
    "#
}

test my_health_policy {
    functions [ExtractHealthPolicy]
    args {
        policy {
            file "../test_pics/poliza_salud.png"
        }
    }
}