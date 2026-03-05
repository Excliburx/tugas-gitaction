# Stage 1: Builder (Tahap persiapan file)
FROM alpine:latest AS builder
WORKDIR /app
COPY index.html .

# Stage 2: Production (Tahap akhir menggunakan Nginx yang sangat ringan)
FROM nginx:alpine
# Hapus default index nginx
RUN rm -rf /usr/share/nginx/html/*
# Copy file HTML dari stage builder
COPY --from=builder /app/index.html /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
