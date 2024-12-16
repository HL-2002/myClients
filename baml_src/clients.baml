// Learn more about clients at https://docs.boundaryml.com/docs/snippets/clients/overview
client<llm> GeminiFlash {
  provider google-ai
  options {
    model "gemini-1.5-flash"
  }
}

client<llm> GeminiPro {
  provider google-ai
  options {
    model "gemini-1.5-pro"
  }
}

client<llm> CustomSonnet {
  provider anthropic
  options {
    model "claude-3-5-sonnet-20241022"
  }
}


client<llm> CustomHaiku {
  provider anthropic
  retry_policy Constant
  options {
    model "claude-3-haiku-20240307"
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/round-robin
client<llm> CustomFast {
  provider round-robin
  options {
    // This will alternate between the two clients
    strategy [GeminiFlash, CustomHaiku]
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/fallback
client<llm> GeminiFallback {
  provider fallback
  options {
    // This will try the clients in order until one succeeds
    strategy [GeminiFlash, GeminiPro]
  }
}

// https://docs.boundaryml.com/docs/snippets/clients/retry
retry_policy Constant {
  max_retries 3
  // Strategy is optional
  strategy {
    type constant_delay
    delay_ms 200
  }
}

retry_policy Exponential {
  max_retries 2
  // Strategy is optional
  strategy {
    type exponential_backoff
    delay_ms 300
    mutliplier 1.5
    max_delay_ms 10000
  }
}