# Day 23

## Description

Day 23 was part one ViewsAndModifiers technique project.

## Tasks

1. Views and modifiers. I created new app called ViewsAndModifiers
2. Why does SwiftUI use structs for views? First, structs are simpler and faster. Moreover, no inheritance! Second, classes can change value inside surprisingly. 
3. What is behind the main SwiftUI view? a lot XD
4. Why modifier order matter. Because it can cause some weird results. Like with background color and frame where background color filled less area than we expected.
5. Why does SwiftUI use "some View" for its view type? It is important for performance. Second, we can build super huge content inside body. Paul also explained why SwiftUI has 10 views limitation.
6. Conditional modifiers. Nothing special - ternary operator and conditional modifier.
7. Environment modifiers. It is super useful but sometimes it is quite tricky because not all modifiers are environmental.
8. Views as properties. It's quite useful to make clear code but it's also a sign of massive view.
9. View composition. Here we are! Reusage of small views to make code look better and reusable!
10. Custom modifiers. One more improvement to our code.
11. BONUS: Custom containers. Generics + SwiftUI for new containers.

## Resources

You can find ViewsAndModifiers [here](/Sources/ViewsAndModifiers/)