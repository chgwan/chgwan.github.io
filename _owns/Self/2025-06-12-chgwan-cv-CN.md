---
title: 万晨光个人简历
author: chgwan
date: 2025-05-01
updated: 2024-05-08
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
    万晨光
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
    <div> <strong> 生日: </strong> 1995-07-31 </div>
    <div> <strong> 国籍: </strong> 中国 </div>
    <div> <strong> 地点: </strong> 新加坡 </div>
    <!-- <div> <strong> TEL: </strong> +86 15665425308 </div> -->
    <div> <strong> 学历: </strong> 博士 </div>
    <div> <strong> 邮件: </strong> chenguang.wan@outlook.com </div>
    </div>
</div>
<img src="formal-wear-half.png" alt="Profile Photo" class="photo">
</div>



## 教育背景

---

| 时间              | 单位                        | 学位                              |
| ----------------- | --------------------------- | --------------------------------- |
| 2017.09 - 2023.03 | 中国科学技术大学            | 理学博士 - 等离子体物理           |
| 2013.09 - 2017.07 | 合肥工业大学                | 工学学士 - 机械设计制造及其自动化 |
| 2021.09 - 2022.10 | 洛桑联邦理工学院 (EPFL)     | 联培博士生                        |
| 2019.07 - 2019.08 | 新加坡国立大学 (NUS)        | 实习助理                          |
| 2018.09 - 2018.10 | 日本国立核融合研究所 (NIFS) | 实习助理                          |


## 工作经历

---

| 时间              | 单位                         | 担任职务 |
| ----------------- | ---------------------------- | -------- |
| 2024.02 - 至今    | 新加坡南洋理工大学 (NTU)     | 研究员   |
| 2023.04 - 2024.02 | 中国科学院合肥物质科学研究院 | 博士后   |

## 期刊论文

---

1. M. Wang, **C. Wan \***, *et al*., Time series extrinsic regression for reconstructing missing electron temperature in tokamak, *Nucl. Fusion*, 2025  **65** 7 076008, doi: [10.1088/1741-4326/addb5f](https://doi.org/10.1088/1741-4326/addb5f).
2. **C. Wan** *et al.*, A high-fidelity surrogate model for the ion temperature gradient (ITG) instability using a small expensive simulation dataset, *Nucl. Fusion*, 2025 **65** 054001, [doi: 10.1088/1741-4326/adc7c9](https://doi.org/10.1088/1741-4326/adc7c9). **封面论文**
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

## 审稿中论文

---

1. E. Gao, **C. Wan \***, *et al.* Bayesian Neural Networks for Predicting Tokamak Energy Confinement Time with Uncertainty Quantification, *submitted to Nucl. Fusion (R1 小修，已返回)*
3. **C. Wan**, *et al.* Machine learning prediction of plasma behavior from discharge configurations on WEST, *submitted to Nucl. Fusion*

## 项目经历
---

1. 中国博士后科学基金会，博士后创新人才支持计划，BX20230371，托卡马克放电建模的深度学习集成模型研究，2023.04 ~ 2025.04，68万元，在研，**主持**
2. 中国博士后科学基金会，博士后面上项目，2023M743541，数据驱动的托卡马克放电预测，2023.11 ~ 2025.11，8万元，在研，**主持**
3. 安徽省科技厅，安徽省博士后基金，2024C997，基于国产生态的托卡马克放电设计，3万元，在研，**主持**
4. 中国科学院合肥物质科学研究院，院长基金青年项目，YZJJ2024QN26，基于人工智能生成模型的托卡马克放电方案设计，2024.01 ~ 2026.12，10万元，在研，**主持**
5. 中国科学院，中国科学院特别研究助理项目，无，无，2023-06至2025-06，80万元，在研，**主持**
6. 中科可控信息产业技术有限公司，光合基金（横向），ghfund202407024875，托卡马克放电预测的国产化，2024.08 ~ 2025.07， 3万元，在研，**主持**
7. 中国科学院等离子体物理研究所, 青年拔尖,  DSJJ-2025-11, 基于生成式AI的智能放电方案生成和实验验证研究, 2025.06 ~ 2027.05, 20万元, 在研, **主持**
8. ZZB，XX专项XX项目，2024.02 ~ 2027.02, 123 万元，在研，**主持**
9. 国家科学技术部，国家磁约束聚变能发展研究专项，2018YFE0304102，Alpha粒子密度和能谱分布的集成建模研究，2018.12 ~ 2023.11，350万元，结项，参与
10. 国家大科学工程，CRAFT项目子课题，CR211005，CRAFT集成数值建模和数据分析系统框架开发，2019.09 ~ 2025.05，300万元，在研，参与
11. 国家大科学工程，CRAFT总控课题，2018-000052-73-01-001228，2019.09 ~ 2025.05，3969万元，在研，参与

## 奖励

---

1. **万晨光**（1/1），合肥物质科学研究院, 青年拔尖, 2025
2. **万晨光**（1/1），蔡诗东等离子体物理奖励评审委员会，蔡诗东优秀博士论文提名奖，2023
3. **万晨光**（1/1）, 中国科学院等离子体物理研究所, 等离子体所优秀博士后 - 前沿物理类, 2024
4. **万晨光**（1/1），中华人民共和国人力资源和社会保障部，第八批博士后创新人才支持计划，2023
5. **万晨光**（1/1），CRAFT项目组，2022年度CRAFT项目希望之星，2022
6. **万晨光**（1/1），ITU，2023 AI for Fusion Energy Challenge, Honorable Mention Certificate, 2023 
7. **万晨光**（1/1），ZZB，2023年度XX专项XX项目，2023

## 专利

---

1. **万晨光**, 高恩亮, 胡友俊, 王明龙, 于治, 袁旗平, 卢敬敬, 肖炳甲, 李建刚, 中国科学院合肥物质科学研究院, 一种基于贝叶斯神经网络的托卡马克能量约束时间预测及不确定性量化方法：
2. **万晨光,** 王明龙, 于治, 袁旗平, 卢敬敬, 胡业民, 肖炳甲, 李建刚, 中国科学院合肥物质科学研究院, 一种基于数据驱动模型的托卡马克磁控制系统优化方法：CN119356106A, 2025.01.24
3. 肖炳甲; 苏畅; 胡文慧; **万晨光**; 袁旗平, 中国科学院合肥物质科学研究院, 一种用于核聚变装置的智能知识检索方法及系统：CN119646175A, 2025.03.18
4. **万晨光**, 刘晓娟, 于治, 李建刚, 中国科学院合肥物质科学研究院. 一种托卡马克磁场最外闭合磁面的建模方法: 202211458248.3[P], 2023-03-14
5. **万晨光**, 刘晓娟, 于治, 李建刚. 中国科学院合肥物质科学研究院. 基于双向长短时记忆神经网络的托卡马克放电建模系统: 202211223038[P], 2022-12-08
6. 邓茜, **万晨光**, 安徽新航电子科技有限公司, 一种基于Inception的卷积神经网络变流器故障诊断方法: CN115951268A, 2023.04.11
7. 于治, 程彬倩, **万晨光**, 项农, 中国科学院合肥物质科学研究院, 一种带不确定度估计的时间序列回归预测方法及系统：CN116720158A, 2023.09.08
8. 刘晓娟, 于治, **万晨光**, 中国科学院合肥物质科学研究院, 一种用于科学计算程序的全生命周期管理系统和方法: 202210114410[P], 2022-01-30
9. 黄佳, 文斐, **万晨光**, 张涛, 冯洋, 叶凯萱, 周振, 李恭顺, 耿康宁, 李国强,  高翔, 中国科学院合肥物质科学研究院, 用于X模极化微波反射计的密度剖面反演方法、装置、设备、存储介质和程序产品: CN120012037A, 2025-05-16

## 软件著作权

---

1. **万晨光,** 王明龙, 于治, 李建刚, 基于RNN和自注意力机制的托卡马克电子温度重建[计算机程序]:
2. **万晨光,** 高恩亮, 胡友俊, 王明龙, 于治, 李建刚, 基于贝叶斯神经网络的托卡马克能量约束时间预测及不确定性量化系统[计算机程序]:
3. **万晨光,** 刘晓娟, 于治, 李建刚. 中国科学院合肥物质科学研究院. TokMag托卡马克磁场重建软件[计算机程序]: 2023SR0330102. 2023-03-14
4. **万晨光,** 刘晓娟, 于治, 李建刚. 中国科学院合肥物质科学研究院. EAST基于机器学习的放电建模系统[计算机程序]: 2021SR1431951. 2021-09-26
5. **万晨光,** 刘晓娟, 于治. 中国科学院合肥物质科学研究院. FyTok托卡马克模拟器软件[计算机程序]: 2021SR1432049. 2021-09-26
6. **万晨光,** 刘晓娟, 于治. 中国科学院合肥物质科学研究院.HPC环境中复杂科学软件包管理和持续集成系统[计算机程序]: 2021SR1431845. 2021-09-26

Online CV: [https://chgwan.github.io/posts/owns/chgwan-cv-CN](https://chgwan.github.io/posts/owns/chgwan-cv-CN)
