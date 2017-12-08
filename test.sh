# GDC
time ~/bin/biobambam2/bin/bamtofastq \
	collate=1 \
	filename=chr22.bam \
	gz=1 \
	inputformat=bam
	level=5 \
	outputdir=./biobambam2 \
	outputperreadgroup= 1 \
	outputperreadgroupsuffixF=_1.fq.gz \
	outputperreadgroupsuffixF2=_2.fq.gz \
	outputperreadgroupsuffixO=_o1.fq.gz \
	outputperreadgroupsuffixO2=_o2.fq.gz \
	outputperreadgroupsuffixS=_s.fq.gz \
	tryoq=1

# run1-no-gzip
time ~/bin/biobambam2/bin/bamtofastq \
    collate=1 \
    filename=/home/ec2-user/workdir/test/bamview/sambamba/sambamba.22.bam \
    gz=0 \
    inputformat=bam \
    level=0 \
    outputdir=./run1-no-gzip \
    outputperreadgroup=1 \
    outputperreadgroupsuffixF=_1.fq.gz \
    outputperreadgroupsuffixF2=_2.fq.gz \
    outputperreadgroupsuffixO=_o1.fq.gz \
    outputperreadgroupsuffixO2=_o2.fq.gz \
    outputperreadgroupsuffixS=_s.fq.gz \
    tryoq=1
    

# run2-collate-0
time ~/bin/biobambam2/bin/bamtofastq \
    collate=1 \
    filename=/home/ec2-user/workdir/test/bamview/sambamba/sambamba.22.bam \
    gz=1 \
    inputformat=bam \
    level=0 \
    outputdir=./run2-collate-0 \
    outputperreadgroup=1 \
    outputperreadgroupsuffixF=_1.fq.gz \
    outputperreadgroupsuffixF2=_2.fq.gz \
    outputperreadgroupsuffixO=_o1.fq.gz \
    outputperreadgroupsuffixO2=_o2.fq.gz \
    outputperreadgroupsuffixS=_s.fq.gz \
    tryoq=1

# GDC
time ~/bin/biobambam2/bin/bamtofastq \
    collate=1 \
    filename=/home/ec2-user/workdir/test/data/smaller.bam \
    gz=0 \
    inputformat=bam \
    level=0 \
    outputdir=./run3-multi-rd \
    outputperreadgroup=1 \
    tryoq=1