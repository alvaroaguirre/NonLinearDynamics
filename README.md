# Non-Linear Dynamics

I have recently started to study Non-Linear Dynamics and chaotic systems, and I find it fascinating! So why not share some of the R code I am building here, in case you are interested in Chaos too.

## Very short introduction to Nonlinearity

![Lorenz' strange attractor](https://user-images.githubusercontent.com/29491896/73464959-951b8780-4377-11ea-9705-a746c01f4d52.png)

_“It used to be thought that the events that changed the world were things like big bombs, maniac politicians, huge earthquakes, or vast population movements, but it has now been realized that this is a very old-fashioned view held by people totally out of touch with modern thought. The things that change the world, according to Chaos theory, are the tiny things. A butterfly flaps its wings in the Amazonian jungle, and subsequently a storm ravages half of Europe.”_
- Terry Pratchett and Neil Gaiman

In a non-linear system, a change in output is not proportional to a change in inputs. And this very simple characteristic makes studying the dynamics of this type of systems very fun. To give you a first taste of the power of non-linearities, consider the next two options:

1) I will give you 10 million dollars each day for the next 100 days.
2) I will give you only one cent today, but every day for the next 100 days, the amount of money you have will double.

If you choose option 1, which clearly sounds more appealing at first glance, you will end up with the modest sum one billion dollars. Not bad... But if you had chosen option 2, you would have ended up with 6.33e27 dollars, which is roughly about 7 **trillion** times the GDP of the world. 

But what I want to tell you about non-linear systems is not the boring difference between linear and exponential. But how sensitive a non-linear system can be on its initial conditions. The quote above mentions the famous "butterfly effect". The metaphors tells us that a tiny change in the initial condition of a system, which for our linear minds should make no difference at all, can actually make a **huge** difference in the dynamics of the system over time. The graph above, which resembles a butterfly's wings, is actually one of Ed Lorenz' [strange attractors](https://en.wikipedia.org/wiki/Lorenz_system). He is considered to be the father of Chaos Theory. 

Perhaps the best way to illustrate the beauty of non-linear dynamics is with a graphical example. So let's consider the Logistic Map, ![alt](https://wikimedia.org/api/rest_v1/media/math/render/svg/ed93f3cd8504352c79c6fc9206e1e9bfac0e3c37) 

![First graph](https://user-images.githubusercontent.com/29491896/73464369-b760d580-4376-11ea-9336-2872ac243a18.png) 
