# notes for bix tool benchmarks

## samtools vs sambamba

```
| based on same BAM (56G)     | real       | user       | sys       |
|-----------------------------|------------|------------|-----------|
| default samtools index      | 23m15.891s | 22m40.372s | 0m19.004s |
| default sambamba index      | 10m15.754s | 52m38.784s | 0m36.388s |
| samtools index -@ 8         | 5m55.692s  | 22m59.688s | 0m30.228s |
| sambamba index -t 8         | 8m20.390s  | 54m17.044s | 0m28.576s |
| default samtools view chr22 | 3m58.323s  | 3m44.196s  | 0m2.192s  |
| default sambamba view chr22 | 1m13.279s  | 8m28.036s  | 0m5.840s  |
| default samtools view chr21 | 4m12.514s  | 3m56.732s  | 0m2.396s  |
| default sambamba view chr21 | 1m18.478s  | 8m57.572s  | 0m6.072s  |
| samtools view chr21 -@ 8    | 0m39.475s  | 4m57.652s  | 0m6.260s  |
| sambamba view chr21 -t 8    | 1m8.604s   | 8m59.916s  | 0m6.628s  |
```