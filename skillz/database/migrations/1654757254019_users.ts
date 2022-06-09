import BaseSchema from "@ioc:Adonis/Lucid/Schema";

export default class UsersSchema extends BaseSchema {
  protected tableName = "users";

  public async up() {
    await this.raw(
      'create extension IF NOT EXISTS "uuid-ossp" schema pg_catalog version "1.1";'
    );

    this.schema.createTable(this.tableName, (table) => {
      table
        .uuid("id")
        .primary()
        .defaultTo(this.db.rawQuery("uuid_generate_v4()").knexQuery);
      table.string("firstname").notNullable();
      table.string("lastname").notNullable();
      table.string("username").notNullable();
      table.string("idskillz").notNullable();
      table.string("email").notNullable().unique();
      table.string("password").notNullable();
      table.string("remember_me_token").nullable();

      /**
       * Uses timestampz for PostgreSQL and DATETIME2 for MSSQL
       */
      table.timestamp("created_at", { useTz: true }).notNullable();
      table.timestamp("updated_at", { useTz: true }).notNullable();
    });
  }

  public async down() {
    this.schema.dropTable(this.tableName);
  }
}
