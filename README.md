- [Overview](#overview)
- [](#section)
- [Download BAM maps](#download-bam-maps)
- [References](#references)

# Overview

<style type="text/css">
pre {
  max-height: 300px;
  overflow-y: auto;
}
pre[class] {
  max-height: 100px;
}
</style>

# 

# Download BAM maps

Use `1_code/r_notebooks/path.Rmd`.

This section shows the process of downloading the BAM maps for BCR 6S
and saving them to a folder.

First, install (if necessary) and load the BAMexploreR library.

Next, load the BAM species table and the v5 and ABMI bird species lists.
Then filter for speices that are present in both lists.

    ##   [1]   1   2   3   4   5   6   8   9  10  11  12  13  14  15  16  17  18  19
    ##  [19]  20  21  22  23  24  26  27  28  29  31  32  33  34  35  37  38  39  40
    ##  [37]  41  42  43  44  45  46  47  48  50  51  52  53  54  55  56  57  58  62
    ##  [55]  63  65  66  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83
    ##  [73]  84  85  87  88  89  90  91  92  94  95  97  99 100 101 102 103 104 105
    ##  [91] 106 107 108 111 112 115 116 117 118 119 120 121 122 123 124

    ##   [1]   1   2   3   5   6   7   9  10  11  12  14  15  17  18  20  21  22  23
    ##  [19]  25  26  28  29  30  31  32  33  34  35  36  37  38  40  41  42  43  44
    ##  [37]  45  48  49  52  53  55  56  59  60  61  64  65  67  68  69  70  72  74
    ##  [55]  77  78  79  81  82  84  86  88  89  90  91  92  93  94  96  98 100 101
    ##  [73] 102 103 104 105 107 108 109 111 112 113 115 116 117 118 121 122 123 125
    ##  [91] 126 127 128 129 130 131 132 134 135 136 138 139 140 141 142

Finally, download the maps for BCR 6.1 and send to the ‘bam_v5_maps’
folder.

# References

<div id="refs">

</div>

<!--chapter:end:index.Rmd-->
