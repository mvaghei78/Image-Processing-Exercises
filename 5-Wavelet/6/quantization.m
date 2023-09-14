function quantized_coefs = quantization(coef, gamma)
[height ,width] = size(coef);
quantized_coefs = zeros(height,width);
for u=1:height
    for v=1:width
        quantized_coefs(u,v) = gamma * sign(coef(u,v)) * floor(abs(coef(u,v))/gamma);
    end
end