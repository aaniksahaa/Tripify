import re

# Specify the input and output file paths

directory = "./backend/sqldump/dump_auto_modifier/"

input_file_path = directory + "a.sql"    # Replace with your input file path
output_file_path = directory + "b.sql"  # Replace with your output file path

# Read the content of the input file
with open(input_file_path, "r") as input_file:
    content = input_file.read()

# Use regular expression to modify the DROP TABLE statements
modified_content = re.sub(r"(DROP TABLE .+?);", r"\1 CASCADE CONSTRAINTS;", content)

# Write the modified content to the output file
with open(output_file_path, "w") as output_file:
    output_file.write(modified_content)

print("Modified dump file has been created:", output_file_path)
