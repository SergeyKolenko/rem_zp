RemZp::Application.config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 24.hours }
RemZp::Application.config.session_store = :redis_store, 'redis://localhost:6379/0/session', { expires_in: 3.month }
