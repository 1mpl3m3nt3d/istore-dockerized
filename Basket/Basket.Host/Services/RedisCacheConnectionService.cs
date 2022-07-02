using Basket.Host.Configurations;
using Basket.Host.Services.Interfaces;

namespace Basket.Host.Services;

public class RedisCacheConnectionService : IRedisCacheConnectionService, IDisposable
{
    private readonly Lazy<ConnectionMultiplexer> _connectionLazy;

    private bool _disposed;

    public RedisCacheConnectionService(
        IOptions<RedisConfig> config)
    {
        var connectionString = Environment.GetEnvironmentVariable("REDIS_TLS_URL") ?? Environment.GetEnvironmentVariable("REDIS_URL") ?? config.Value.ConnectionString;

        var redisConfigurationOptions = GetRedisConnectionString(connectionString);

        _connectionLazy =
            new Lazy<ConnectionMultiplexer>(()
                => ConnectionMultiplexer.Connect(redisConfigurationOptions));
    }

    public IConnectionMultiplexer Connection => _connectionLazy.Value;

    public void Dispose()
    {
        if (!_disposed)
        {
            Connection.Dispose();
            _disposed = true;
        }

        GC.SuppressFinalize(this);
    }

    private string GetRedisConnectionString(string connectionString)
    {
        if (connectionString.StartsWith("redis://") || connectionString.StartsWith("rediss://"))
        {
            var uri = new Uri(connectionString);

            var host = uri.Host;
            var port = uri.Port;
            var userInfo = uri.UserInfo.Split(':', 2);
            var user = userInfo[0];
            var password = userInfo[1];

            var keyValueConnectionString = $"{host}:{port},user={user},password={password},";

            if (connectionString.StartsWith("rediss://"))
            {
                keyValueConnectionString += "ssl=true";
            }

            return keyValueConnectionString;
        }
        else
        {
            return connectionString;
        }
    }
}
