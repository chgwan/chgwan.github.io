---
title: Chenguang Wan's Resume
author: chgwan
date: 2025-05-01
# updated: 2024-05-08
# tags: [Tutorial, Jekyll]
# render_with_liquid: false
# layout: cv
media_subpath: "/assets/img/portraits"
---

<style>
  /* print control to make some element invisiable */
    @media print {
      header, .post-tail-wrapper, .utterances, footer, #tail-wrapper {
        display: none;
      }
    }
    body {
      font-family: Arial, sans-serif;
      margin: 30px;
    }

    h2 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    
    hr {
      height: 4px;
      background-color: black;
      border: none;
      margin: 10px 0 20px 0;
      /* max-width: 900px; */
    }
    
    .myheader {
      display: flex;
      align-items: stretch; /* match heights */
      justify-content: space-between;
      /* max-width: 900px; */
      margin-bottom: 0px;
      /* border-bottom: 4px solid black; */
      /* padding-bottom: 10px; */
    }
    
    .left-side {
      display: flex;
      flex-direction: column;
      justify-content: center;
      flex: none;
      margin-bottom: 0px; 
    }
    
    .name {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .name a img {
        height: 20px;
        vertical-align: middle;
        transition: opacity 0.2s ease;
    }
    
    .name a: hover img {
        opacity: 0.7;
    }
    
    .info-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      column-gap: 40px;
      row-gap: 10px;
      font-size: 16px;
      margin-bottom: 0px; 
    }
    
    .info-grid div {
      white-space: nowrap;
    }
    
    .info-grid strong {
      margin-right: 5px;
    }

  .photo {
    width: auto;
    height: auto;
    aspect-ratio: 1/1;
    max-height: 12.5rem;
    object-fit: cover;
    margin-left: 1rem;
  }


  @media (max-width: 600px) {
    .myheader {
      flex-direction: column;
      align-items: flex-start;
    }

    .photo {
      order: -1;                /* Move photo above .left-side */
      margin-bottom: 1rem;
      max-height: 200px;
      width: auto;
    }
    
    .info-grid {
      grid-template-columns: 1fr;
    }
    
    .left-side {
      width: 100%;
      flex: none;               /* Prevent stretching */
    }
  }
</style>

<div class="myheader">
<div class="left-side">
    <div class="name">
    Chenguang Wan
    <a href="https://scholar.google.com/citations?user=ncURiLEAAAAJ&hl=en" target="_blank">
        <img src="scholar.png" alt="Google Scholar">
    </a>
    <a href="https://orcid.org/0000-0002-6005-4460" target="_blank">
        <img src="ORCID.png" alt="ORCID">
    </a>
    </div>
    <!-- <div class="separator"> </div> -->
    <hr>
    <div class="info-grid">
    <div> <strong> Birthday: </strong> 1995-07-31 </div>
    <div> <strong> Nationality: </strong> China </div>
    <div> <strong> Location: </strong> Singapore </div>
    <!-- <div> <strong> TEL: </strong> +86 15665425308 </div> -->
    <div> <strong> Degree: </strong> Doctor Degree </div>
    <div> <strong> E-Mail: </strong> chenguang.wan@outlook.com </div>
    </div>
</div>
<img src="formal-wear-half.png" alt="Profile Photo" class="photo">
</div>


## EDUCATION

---

| Date                  | Institution                                     | Degree                            |
| --------------------- | ----------------------------------------------- | --------------------------------- |
| Sep. 2017 - Mar. 2023 | University of Science and Technology of China   | Doctor - Plasma Physics           |
| Sep. 2013 - Jul. 2017 | Hefei University of Technology (HFUT)           | Bachelor - Mechanical Engineering |
| Sep. 2021 - Oct. 2022 | École Polytechnique Fédérale de Lausanne (EPFL) | Visiting                          |
| Jul. 2019 - Aug. 2019 | National University of Singapore (NUS)          | Visiting                          |
| Sep. 2018 - Oct. 2018 | National Institute for Fusion Science (NIFS)    | Visiting                          |


## CAREERS

---

| Date                  | Institution                               | Role                   |
| --------------------- | ----------------------------------------- | ---------------------- |
| Feb. 2024 - Present   | Nanyang Technological University (NTU)    | Research Fellow        |
| Apr. 2023 - Feb. 2024 | Hefei Institutes of Physical Science, CAS | Postdoctoral Associate |

## SELECTED PUBLICATIONS

---

1. M. Wang, **C. Wan \***, *et al*., Time series extrinsic regression for reconstructing missing electron temperature in tokamak, *Nucl. Fusion*, 2025  **65** 7 076008, doi: [10.1088/1741-4326/addb5f](https://doi.org/10.1088/1741-4326/addb5f).
2. **C. Wan** *et al.*, A high-fidelity surrogate model for the ion temperature gradient (ITG) instability using a small expensive simulation dataset, *Nucl. Fusion*, 2025 **65** 054001, [doi: 10.1088/1741-4326/adc7c9](https://doi.org/10.1088/1741-4326/adc7c9).
3. J. Huang <sup>#</sup>, **C. Wan <sup>#</sup> \*** *et al.*,, Development of real-time density profile inversion with deep neural network model for multi-bands X-mode polarization reflectometer on EAST, *Plasma Phys. Control. Fusion,* 2025 67, 055002, [doi: 10.1088/1361-6587/adc830](https://doi.org/10.1088/1361-6587/adc830).
4. **C. Wan \***, *et al.* Predict the last closed-flux surface evolution without physical simulation. *Nucl. Fusion* 2024 **64** 026014, [doi: 10.1088/1741-4326/ad171f](https://doi.org/10.1088/1741-4326/ad171f).
5. **C. Wan \***, *et al.* A machine-learning-based tool for last closed-flux surface reconstruction on tokamaks. 2023 *Nuclear Fusion* **63**, 056019, [doi: 10.1088/1741-4326/acbfcc](https://doi.org/10.1088/1741-4326/acbfcc).
6. **C. Wan \***, *et al.* EAST discharge prediction without integrating simulation results. 2022 *Nucl. Fusion* **62** 126060, [doi: 10.1088/1741-4326/ac9c1a](https://doi.org/10.1088/1741-4326/ac9c1a).
7. **C. Wan \***, *et al.* A Robust and Fast Data Management System for Machine-Learning Research of Tokamaks. 2022 *IEEE Transactions on Plasma Science* **50** 4980-4986, [doi: 10.1109/TPS.2022.3223732](https://doi.org/10.1109/TPS.2022.3223732).
8. **C. Wan**, *et al.* Experiment data-driven modeling of tokamak discharge in EAST. 2021 *Nucl. Fusion* **61** 066015, [doi: 10.1088/1741-4326/abf419](https://doi.org/10.1088/1741-4326/abf419).
9. X. Deng, **C. Wan \***, *et al.* Open-Switch Fault Diagnosis of Three-Phase PWM Converter Systems for Magnet Power Supply on EAST. *IEEE Transactions on Power Electronics* 2023 **38** 1064-1078, [doi: 10.1109/TPEL.2022.3194113](https://doi.org/10.1109/TPEL.2022.3194113).
10. C. Su, **C. Wan \***, *et al.*, Interaction AI with Retrieval-enhanced Generation for Knowledge Retrieval in EAST, in 2024 3rd International Conference on Data Analytics, *Computing and Artificial Intelligence (ICDACAI)*, Zakopane, Poland: IEEE, Oct. 2024 965-969, [doi: 10.1109/ICDACAI65086.2024.00181](https://doi.org/10.1109/ICDACAI65086.2024.00181).
11. B. Cheng, **C. Wan \***, *et al.*, PCC-Trans: a time series feature selection and model framework for tokamak discharge process in EAST, in *International Conference on Image, Signal Processing, and Pattern Recognition (ISPP 2024)*,  Guangzhou, China: SPIE, Jun. 2024 236. [doi: 10.1117/12.3034112](https://doi.org/10.1117/12.3034112).
12. S. Bai, **C. Wan \***, *et al.*, Integrated Data-Driven and Physics-Driven Multi-Module Magnetic Equilibrium Calculation and Analysis Tool, in 2024 7th *International Conference on Advanced Algorithms and Control Engineering (ICAACE)*, Shanghai, China: IEEE, Mar. 2024 786-791. [doi: 10.1109/ICAACE61206.2024.10549744](https://doi.org/10.1109/ICAACE61206.2024.10549744).

## WORKING PAPERS

---

1. **C. Wan**, *et al.* Bayesian Neural Networks for Predicting Tokamak Energy Confinement Time with Uncertainty Quantification, *submitted to Nucl. Fusion (R1)*
3. **C. Wan**, *et al.* Machine learning prediction of plasma behavior from discharge configurations on WEST, *submitted to Nucl. Fusion*

## PROJECTS

---

| Date                  | Title                                              | Role               |
| --------------------- | -------------------------------------------------- | ------------------ |
| Jan. 2024 - Dec. 2025 | Discharge Scenario design based on AIGC            | Host               |
| Jan. 2021 - Dec. 2025 | Deep learning ensemble model for tokamak discharge | Host               |
| May. 2020 - Dec. 2025 | Magnetic field reconstruction and control on EAST  | Principal Executor |
| Jul. 2018 - May. 2020 | Tokamak discharge modeling                         | Principal Executor |


## AWARDS

---

- Aug. 2023 - Outstanding Doctoral Thesis Nomination of CPS  
- Oct. 2023 - China National Postdoctoral Program for Innovative Talents
- Dec. 2023 - ITU, AI for Fusion Energy Challenge, Honorable Mention Certificate 


## SKILLS

---

- **Good**: Python, PyTorch, HDF5, MongoDB, Linux, LaTeX, Machine learning, Database build and management  
- **Modest**: C/C++, Web, Docker

Online CV: [https://chgwan.github.io/posts/owns/chgwan-cv](https://chgwan.github.io/posts/owns/chgwan-cv)
