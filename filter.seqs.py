from Bio import SeqIO
# import SeqIO module from Biopython to read and write FASTA files

#input FASTA file with protein sequences
input_file = "proteins.fasta"

#output FASTA file after filtering
output_file = "proteins.filtered.fasta"

#open output file for writing filtered sequences
with open(output_file, "w") as out_handle:
    #iterate over each record in the input FASTA file
    for record in SeqIO.parse(input_file, "fasta"):
        #keep only sequences without '.' characters
        if "." not in str(record.seq):
            #write filtered sequence to output FASTA file
            SeqIO.write(record, out_handle, "fasta")

#print message after filtering is done if everthing is go Right I got Output file
print(f"Filtered sequences written to {output_file}")
