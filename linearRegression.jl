using FundamentalsNumericalComputation
using Statistics
using Plots

# Normal Equation
londonLat = 51.072;
londonLong = 0.1276;
years1935 = [1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946]
years1945 = [1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956]
airPollution1935 = [409.09, 405.45, 401.82, 400, 384.09, 368.18, 352.27, 336.36, 320.45, 304.55, 288.64, 272.73]
airPollution1946 = [288.64, 272.73, 256.82, 240.91, 225, 209.09, 204.86, 200.62, 196.39, 192.15, 187.92, 183.68]
population1935 = [7586500/1000000, 7612600/1000000, 7638000/1000000, 7662800/1000000, 7686900/1000000, 7710600/1000000, 7733600/1000000, 7756000/1000000, 7780000/1000000, 7799300/1000000, 7820100/1000000, 7840400/1000000]
population1946 = [20300/1000000, 7840400/1000000, 7860200/1000000, 7879500/1000000, 7898300/1000000, 7916600/1000000, 7934400/1000000, 7951800/1000000, 7968700/1000000, 7985200/1000000, 8001200/1000000, 8016800/1000000]
avgMaxTemp1936_1946 = [57.675, 56.775, 57.525, 57.525, 55.275, 57.525, 57.525, 57.525, 57.525, 57.525, 57.525]
avgMinTemp1936_1946 = [44.95, 45.05, 46.3, 45.05, 44.925, 45.05, 45.05, 45.4, 45.05, 45.05, 45.05]
avgMaxTemp1946_1956 = [57.525, 57.525, 57.525, 57.525, 57.525, 57.525, 57.525, 57.25, 57.25, 57.25, 66]
avgMinTemp1946_1956 = [45.05, 45.05, 45.05, 45.05, 45.05, 45.05, 45.05, 45.225, 45.225, 40.225, 54]

deltaAirPollution = [405.45-409.09, 401.82-405.45, 400-401.82, 384.09-400, 368.18-384.09, 352.27-368.18, 336.36-352.27, 320.45-336.36, 304.55-320.45, 288.64-304.55, 272.73-288.64, 256.82-272.73, 240.91-256.82, 225-240.91, 209.09-225, 204.86-209.09, 200.62-204.86, 196.39-200.62, 192.15-196.39, 187.92-192.15, 183.68-187.92]
deltaPopulation =[26100, 25400, 24800, 24100, 23700, 23000, 22400, 24000, 19300, 20800, 20300, 19800, 19300, 18800, 18300, 17800, 17400, 16900, 16500, 16000, 15600]
londonLat21 = [londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat, londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat,londonLat, londonLat]
londonLong21 = [londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong, londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong,londonLong, londonLong]
A = [londonLat21 londonLong21 deltaAirPollution deltaPopulation]
b1 = [57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675,57.525-57.675]
b2 = [66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525,66-57.525]
b = [b1 b2]
x = A\b

f(year, population) = result[4,1] * year + result[4, 2] * population
plot(f(years1945, population1946))
scatter!(avgMaxTemp1936_1946)

# function gradientDescent(x, y, α, fitted, numberOfIterations)
#     m = length(y)
#     if fitted
#         C = ones(m, 1)    
#         x = hcat(C,x)
#     else
#         x
#     end
  
#     n = size(x)[2]
#     θ = ones(n)
  
#     for i in range(1, stop=numberOfIterations)
#         pred = x * θ
#         println(cost(x, y, θ))
#         θ = θ - ((α/m) * x') * (pred - y)
#     end
#     return θ
  
# end
  
# function cost(x, y, θ)
#     m = size(x)[1]
#     loss = x * θ - y
#     return (1/2length(y)) * loss' * loss
# end

# Gradient Descent - avgTemp1935_1946 - Pollution
# years1935 = [1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946]
# airPollution1935_1946 = [409.09, 405.45, 401.82, 400, 384.09, 368.18, 352.27, 336.36, 320.45, 304.55, 288.64, 272.73]
# avgTemp1935_1946 = [51.3125, 51.3125, 50.9125, 51.9125, 51.2875, 50.1, 51.2875, 51.2875, 51.4625, 51.2875, 51.2875, 51.2875]

# X = [1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946; 409.09 405.45 401.82 400 384.09 368.18 352.27 336.36 320.45 304.55 288.64 272.73]
# X = X'

# y = avgTemp1935_1946;
# result = gradientDescent(X, y, 0.0000005, false, 5000)
# f(year, pollution) = result[1] * year + result[2] * pollution

# scatter(y, xlims = (0, 15), ylims = (45, 55))
# plot!(f(years1935, airPollution1935_1946))

# Gradient Descent - avgTemp1945_1956  - Pollution
# year1945_1956 = [1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956]
# airPollution1945_1956 = [288.64, 272.73, 256.82, 240.91, 225, 209.09, 204.86, 200.62, 196.39, 192.15, 187.92, 183.68]
# avgTemp1945_1956 = [51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2375, 51.2375, 48.7375, 60]

# X = [1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956; 288.64 272.73 256.82 240.91 225 209.09 204.86 200.62 196.39 192.15 187.92 183.68]
# X = X'

# y = avgTemp1945_1956;
# result = gradientDescent(X, y, 0.0000005, false, 5000)
# f(year, pollution) = result[1] * year + result[2] * pollution

# scatter(y, xlims = (0,15), ylims = (40,65))
# plot!(f(year1945_1956, airPollution1945_1956))

# function normalize(X)
#     mn = Statistics.mean(X)
#     stdDev = std(X)
#     X = (X .- mn) / stdDev;
#     return X;
# end

# Gradient Descent - avgTemp1935_1946 - Population
# years1935 = [1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946]
# population1935_1946 = [7586500, 7612600, 7638000, 7662800, 7686900, 7710600, 7733600, 7756000, 7780000, 7799300, 7820100, 7840400]
# normPopulation1935_1946 = normalize(population1935_1946)
# avgTemp1935_1946 = [51.3125, 51.3125, 50.9125, 51.9125, 51.2875, 50.1, 51.2875, 51.2875, 51.4625, 51.2875, 51.2875, 51.2875]

# X = [1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946; normPopulation1935_1946']
# X = X'

# y = avgTemp1935_1946;
# result = gradientDescent(X, y, 0.0000005, false, 5000)
# f(year, population) = result[1] * year + result[2] * population

# scatter(y, xlims = (0, 15), ylims = (45, 55))
# plot!(f(years1935, normPopulation1935_1946))

# Gradient Descent - avgTemp1945_1956  - Population
# year1945_1956 = [1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956]
# population1945_1956 = [7820100, 7840400, 7860200, 7879500, 7898300, 7916600, 7934400, 7951800, 7968700, 7985200, 8001200, 8016800]
# normPopulation1945_1956 = normalize(population1945_1956)
# avgTemp1945_1956 = [51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2875, 51.2375, 51.2375, 48.7375, 60]

# X = [1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956; normPopulation1945_1956']
# X = X'

# y = avgTemp1945_1956;
# result = gradientDescent(X, y, 0.0000005, false, 5000)
# f(year, population) = result[1] * year + result[2] * population

# scatter(y, xlims = (0,15), ylims = (40,65))
# plot!(f(year1945_1956, normPopulation1945_1956))