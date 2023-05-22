**Double Link Inverted Pendulum and Cart System**

This repository presents a formal solution to the classic problem of maintaining the balance of an inverted pendulum riding on a movable carriage that moves in parallel. The project addresses this control systems challenge in three distinct phases.


**Phase 1**

In this phase, the following steps were investigated:

1- Nonlinear Model: The nonlinear model of the system was derived, and its parameters were introduced.

2- Linearization: The obtained model was linearized around an appropriate operating point, and the equations were converted into state space form. The valid range of the resulting linear system was also determined.

3- Jordan Block Diagonal Form: The Jordan block diagonal form and the transformation matrix of the system were determined.

4- Transformation Function: The transformation function was obtained, and its zero and pole diagram were analyzed.

5- Internal Stability: The internal stability of the system was checked, determining whether it is asymptotic or boundary stable.

6- State Transition Matrix: The state transition matrix of the system, along with the state and output responses to arbitrary initial conditions and step inputs, was computed.

7-Initial Conditions: The initial conditions were selected in such a way that a certain frequency of the output was not stimulated.

8- Kalman Decomposition: The system and subsystems were decomposed using the Kalman decomposition technique.

9- System Observability and Controllability: The minimalness of the state space was evaluated, identifying controllable and observable poles. The stability and detectability of the system were assessed.

**Phase 2**

In this phase, the following steps were undertaken:

1- Irreducible Subsystem: The irreducible subsystem of the linearized system was obtained.

2- Performance Criterion: A meaningful performance criterion for the desired system was defined. Based on this criterion, the desired poles were determined. A mode 3-feedback controller was designed to achieve the defined goals while ensuring stability.

3- System Simulation: The nonlinear and linearized systems were simulated with the designed feedback controller, and the performance of the system was analyzed.

4- Reference Signal: An appropriate reference signal for the tracking system was defined. Static and dynamic precompensators were designed for the linearized system, and their performance was evaluated in the presence of constant disturbance.

**Phase 3**

In this phase, the focus was on observer design:

1- Full-Order Observer: A full-order observer was designed based on the system's characteristics.

2- Reduced-Order Observer: A reduced-order observer was also designed. The performance of both observers was compared in terms of estimation quality.

Please feel free to explore the code and files provided in this repository. For any questions or inquiries, kindly reach out to me.
