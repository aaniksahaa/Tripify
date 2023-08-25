input_file_names = [
    'overview.sql',
    'destroy_structure.sql',
    'ddl.sql',
    'custom_types.sql',
    'procedures.sql',
    'functions.sql',
    'triggers.sql',
    'large_insert.sql',
    'overview.sql'
]

base_path = './backend/sqldump/'
output_file_name_first_time = base_path + '/master_dump/dump_first_time.sql'
output_file_name_any_time_later = base_path + '/master_dump/dump_any_time_later.sql'

# Function to read contents of a file
def read_file_contents(file_name):
    with open(base_path + file_name, 'r') as file:
        return file.read()

# Concatenate contents of input files
concatenated_sql_first_time = ''
for file_name in input_file_names:
    sql_content = read_file_contents(file_name)
    concatenated_sql_first_time += '\n\n----' + file_name + '----\n\n'
    concatenated_sql_first_time += sql_content + '\n\n'  # Adding two newlines for separation

# Write concatenated contents to the output file
with open(output_file_name_first_time, 'w') as output_file:
    output_file.write(concatenated_sql_first_time)

print(f"Concatenated SQL written to {output_file_name_first_time}")


# Concatenate contents of input files
concatenated_sql_any_time_later = ''
for file_name in input_file_names:
    if(file_name == 'custom_types.sql'):
        continue
    sql_content = read_file_contents(file_name)
    concatenated_sql_any_time_later += '\n\n----' + file_name + '----\n\n'
    concatenated_sql_any_time_later += sql_content + '\n\n'  # Adding two newlines for separation

# Write concatenated contents to the output file
with open(output_file_name_any_time_later, 'w') as output_file:
    output_file.write(concatenated_sql_any_time_later)

print(f"Concatenated SQL written to {output_file_name_any_time_later}")
