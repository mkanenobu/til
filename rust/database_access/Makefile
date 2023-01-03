run_migrate:
	diesel migration run

show_posts:
	cargo run --bin show_posts

write_post:
	cargo run --bin write_post

# ex) make publish_post id=1
publish_post:
	@echo Target ID: $(id)
	cargo run --bin publish_post $(id)

delete_post:
	@echo Target ID: $(id)
	cargo run --bin delete_post $(id)
