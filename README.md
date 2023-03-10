# demo-mbo

This is a collection of short demo notebooks for using human-in-the-loop `mlr3mbo` for the AAAI-23 Bridge Program.
Some prior knowledge of R is required to follow along the notebook.   
The interested coder can refer to the [mlr3book](https://mlr3book.mlr-org.com/) for detailed explanations and examples.

1/31/2023  
To follow along with these notebooks, you have several options:
1. Run [colab notebook](https://colab.research.google.com/drive/1gG3RCvIgrvD5ntH020SfjVsoPmJREX9B?usp=share_link).
2. Clone this repo locally and run them on your own R IDE of choice, e.g. `Rstudio`
(R version 4.2.2 works fine with `mlr3`, libraries must be manually installed)

Content:

1. [`R6` basics](r6-basics.Rmd)
2. [`mlr3` basics](mlr3-basics.Rmd)
3. [`mlr3mbo` basics](mlr3mbo-basics.Rmd)
4. [`mlr3mbo` human-in-the-loop](mlr3mbo-human-in-the-loop.Rmd)
5. [mlr3-benchmarking](mlr3-benchmarking.Rmd)
6. [mlr3-further-analysis](mlr3-further-analysis.Rmd)

If you decide to use the physical experiment data `GOQ.csv`, `PI.csv` or `GOPI.csv` for benchmarking or accelerated materials discovery purposes, be sure to cite:
```
@incollection{kotthoff2022optimizing,
  title={Optimizing Laser-Induced Graphene Production},
  author={Kotthoff, Lars and Dey, Sourin and Heil, Jake and Jain, Vivek and Muller, Todd and Tyrrell, Alexander and Wahab, Hud and Johnson, Patrick},
  booktitle={PAIS 2022},
  pages={31--44},
  year={2022},
  publisher={IOS Press}
}

@article{wahab2020lig,
   author = {Wahab, Hud and Jain, Vivek and Tyrrell, Alexander Scott and Seas, Michael Alan and Kotthoff, Lars and Johnson, Patrick Alfred},
   title = {Machine-learning-assisted fabrication: Bayesian optimization of laser-induced graphene patterning using in-situ Raman analysis},
   journal = {Carbon},
   volume = {167},
   pages = {609-619},
   ISSN = {0008-6223},
   DOI = {https://doi.org/10.1016/j.carbon.2020.05.087},
   url = {http://www.sciencedirect.com/science/article/pii/S0008622320305285},
   year = {2020},
   type = {Journal Article}
}
```
