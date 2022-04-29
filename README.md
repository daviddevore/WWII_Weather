# The Effects of WW2 on London’s Weather and Air Quality
David DeVore
Yash Patel
Caleb Emerson
Noah Meininger
George Rauta
Akanksh Jain
 
# Our Problem
This project is concerned with the analysis of the effects of World War 2(WWII) on the weather in London, United Kingdom. We are looking to find the relationship between the effects of WWII, including attacks, industry changes, and rebuilding and changes in the weather in the following decade. We will analyze temperature data starting in 1936, before WWII. and for the next 20 years after that, ending in 1956. The weather data was found through the United Kingdom's \emph{Met Office} which has an archive of "Daily Weather Reports." These reports occurred once every three months and kept track of all important weather fluctuations in London. For any given year in our time frame (stated above) we took all four "Daily Weather Reports" that occurred for that year and took the average minimum temperature and average maximum temperature. In addition to temperature data, we have also gathered data regarding the change in population as well as the change in air pollution measured SPM (Suspended Particulate Matter) that existed in London during the years in question. 
Algorithms
In order to solve this problem, we have begun by gathering our data and will structure it in a way that will allow us to perform linear regression using Gradient Descent and the Normal Equation.
The Gradient Descent equation is defined by ∇𝜙(𝐱)=2𝐉(𝐱)^(𝑇)𝐟(𝐱). Where delta phi(x) is the gradient, J(x) is the Jacobian, and f(x) is our function. Using Gradient descent will help us optimize our error. We will use the following formulation of our problem:
[latitude | longitude |  air pollution |  population] [X3 | X4] = [T1946-T1936 | T1956-T1946]
Where A is our latitude, longitude, air pollution change, and population change; x is our unknown, and T is the temperature differences between the years 1946 and 1936, and 1956 and 1946. We want to minimize our value for x as it will represent our error. A low error will show that our model is accurate in predicting the temperature change London experienced around WWII.
The Normal Equation is defined by Ax=b. The formulation of our problem is the same as that used in Gradient Descent.

# Method of Comparison
For this linear regression problem, it is important to recognize the difference between a relationship that fits the data well and a relationship that fits the trends shown by the data well. While we could easily fit a function to the data points perfectly, such a relationship could seem nonsensical when actually analyzed. Instead, we are looking for functions that can generalize the data we present well. 

To accomplish this, we will use Leave-One-Out Cross Validation (LOOCV). In this process we will set aside a single data point and use the rest of the data in the linear regression to fit our function. We will then test the function against the single data point that was left out. This process will be repeated for each data point, generating a new function each time. That new function will then be tested against its respective data point. 

Once the linear regression is finished, these cross-validation points will be used to judge how well the fitted function can generalize the data that it had not been trained on. This judgment will be carried using the mean squared error, 
MSE((i))=(h(i)(x(i))-y(i))2 
where h(i)(x(i)) is our fitted function with vector of coefficients (i) given by fitting the model without the ith data point. This function will be operating on the ith vector x(i), which will be our cross-validation data point and y(i) is the ith result given by that data point. We decided to use the mean squared error as it is a commonly used and easy to implement method of calculating error caused by linear regression.
	
We will then take the average of all of the MSE((i)), shown in the equation 
MSEtest=1ni=1nMSE((i))

With this, fittings with higher MSEtest will be assumed to be worse generalizations of the data compared to fittings with lower MSEtest. We can then make the further assumption that better algorithms give us better functions, giving us a quick and clear comparison between algorithms.
