# Use OpenJDK 21 as the base image
FROM openjdk:21

# Set the working directory in the container
WORKDIR /app

# Copy the HelloWorld.java file into the container
COPY HelloWorld.java /app

# Compile the Java program
RUN javac HelloWorld.java

# Run the compiled Java program
CMD ["java", "HelloWorld"]
