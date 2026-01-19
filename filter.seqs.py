from Bio import SeqIO

# Simple version - just filters and writes
input_file = "proteins.fasta"
output_file = "proteins.filtered.fasta"

with open(output_file, "w") as out_handle:
    for record in SeqIO.parse(input_file, "fasta"):
        if "." not in str(record.seq):  # Only write if NO dots
            SeqIO.write(record, out_handle, "fasta")

print(f"Filtered sequences written to {output_file}")
