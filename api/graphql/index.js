const { ApolloServer, gql } = require("apollo-server-cloud-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();

const typeDefs = gql`
  type Flight {
    id: ID!
    aircraftId: String
    origin: String
    dest: String
  }

  type Query {
    flights: [Flight]
  }
`;

const resolvers = {
  Query: {
    flights: async () => {
      const snapshot = await db.collection("flights").get();
      return snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
    }
  }
};

const server = new ApolloServer({ typeDefs, resolvers });
exports.graphqlHandler = server.createHandler();