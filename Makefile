dev:
	docker compose up

clean:
	docker compose down

purge:
	docker compose down --rmi all -v
