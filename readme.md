# notes for bix tool benchmarks

## samtools vs sambamba

### index

```
| based on same BAM (56G)     | real       | user       | sys       |
|-----------------------------|------------|------------|-----------|
| default samtools index      | 23m15.891s | 22m40.372s | 0m19.004s |
| default sambamba index      | 10m15.754s | 52m38.784s | 0m36.388s |
| samtools index -@ 8         | 5m55.692s  | 22m59.688s | 0m30.228s |
| sambamba index -t 8         | 8m20.390s  | 54m17.044s | 0m28.576s |
```

### view

```
| based on same BAM (56G)     | real       | user       | sys       |
|-----------------------------|------------|------------|-----------|
| default samtools view chr22 | 3m58.323s  | 3m44.196s  | 0m2.192s  |
| default sambamba view chr22 | 1m13.279s  | 8m28.036s  | 0m5.840s  |
| default samtools view chr21 | 4m12.514s  | 3m56.732s  | 0m2.396s  |
| default sambamba view chr21 | 1m18.478s  | 8m57.572s  | 0m6.072s  |
| samtools view chr21 -@ 8    | 0m39.475s  | 4m57.652s  | 0m6.260s  |
| sambamba view chr21 -t 8    | 1m8.604s   | 8m59.916s  | 0m6.628s  |
```

## picard vs biobambam2

### bam2fastq
```
time java -jar ~/bin/picard.jar SamToFastq \
	INPUT=chr22.bam \
	OUTPUT_PER_RG=true \
	OUTPUT_DIR=./picard \
	GZOPRG=true \
	INCLUDE_NON_PF_READS=true \
	INCLUDE_NON_PRIMARY_ALIGNMENTS=true


```

```
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
```

```
| on chr22 from 56G BAM    | real      | user      | sys       |
|--------------------------|-----------|-----------|-----------|
| picard paired mode gz L5 | 3m17.964s | 3m25.008s | 0m1.328s  |
| picard RG mode gz L5     | 3m19.826s | 3m25.940s | 0m1.108s  |
| biobambam gz L5          | 2m31.392s | 2m29.936s | 0m1.060s  |
| picard paired mode no gz | 1m10.464s | 1m4.288s  | 0m11.800s |
| picard RG mode no gz     | 1m9.361s  | 1m3.244s  | 0m11.348s |
| biobambam no gz          | 0m42.858s | 0m23.464s | 0m2.232s  |
```