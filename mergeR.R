# Code to query the Go terms associated with a single uniprot


require("biomaRt")
ensembl=useMart("ensembl",dataset="hsapiens_gene_ensembl")

# There are 301 filters
# filters are the keys to get specific things
filters=listFilters(ensembl)

# There are 1149 attributes
# Attributes are the values
attributes = listAttributes(ensembl)

# Searching for filter
#"uniprot_swissprot_accession"

grep("UniProt", filters$name, ignore.case=T, value=T)
 
# Searching for attributes
# "go_id"
grep("go", attributes$name, ignore.case=T, value=T)

# This is Histone
query="P68431"

# The query meat - gets you the associated GO terms
getBM(attributes="go_id", filters="uniprot_swissprot_accession", values= query, mart=ensembl)

# Now to get the Terms in word
require("GO.db")
goterms=getBM(attributes="go_id", filters="uniprot_swissprot_accession", values= query, mart=ensembl)
Term(goterms$go_id)

# Creates a dataframe with go_ids and Terms
go_df=na.omit(as.data.frame(Term(goterms$go_id)))

# I need to create a col where the value is just the uniprot identifer
# Well we need to create a df 
total <- rbind(data frameA, data frameB)