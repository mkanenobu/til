import { prisma } from "../src/db";

const insertSeed = async () => {
  await prisma.company.create({
    data: {
      name: "Test Company",
      Users: {
        create: [
          {
            email: "john@example.com",
            name: "John Doe",
            Posts: {
              create: [
                {
                  title: "Hello, World!",
                  content: "This is my first post.",
                },
                {
                  title: "Goodbye, World!",
                  content: "This is my last post.",
                },
              ],
            },
          },
          {
            email: "alice@example.com",
            name: "Alice Smith",
          },
          {
            email: "bob@example.com",
            name: "Bob Johnson",
            Posts: {
              create: [
                {
                  title: "Bob's first post",
                  content: "This is my first post.",
                },
              ],
            },
          },
        ],
      },
    },
  });
};

insertSeed();
