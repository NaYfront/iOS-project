//
//  InfoBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol InfoBuilderProtocol {
    func createInfoFirstScreen(router: InfoRouterProtocol) -> UIViewController
    func createInfoSecondScreen(listenContent: ListenContent, router: InfoRouterProtocol) -> UIViewController
    func createInfoModuleContent() -> CellContent
}

class InfoModuleBuilder: InfoBuilderProtocol {
    func createInfoFirstScreen(router: InfoRouterProtocol) -> UIViewController {
        let view = InfoViewController()
        let presenter = InfoPresenter(view: view, router: router, cellContent: createInfoModuleContent())
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "book.fill"), tag: 0)
        view.title = "Discover"
        
        return view
    }
    
    func createInfoSecondScreen(listenContent: ListenContent, router: InfoRouterProtocol) -> UIViewController {
        let view = InfoDetailViewController()
        let presenter = InfoDetailPresenter(view: view, content: listenContent, router: router)
        view.presenter = presenter

        return view
    }
    
    func createInfoModuleContent() -> CellContent {
        let bigCellContent =
        [
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "deepBlue-1") ?? .white, listenContent: importanceContent),
            BigCellContent(mainTitle: "Sleep Phases", additionalTitle: "What Is the Sleep Cycle?", color: UIColor(named: "deepPurple-1") ?? .white, listenContent: sleepPhasesContent),
            BigCellContent(mainTitle: "Sleep Modes", additionalTitle: "What are the different sleep modes?", color: UIColor(named: "iceGreen") ?? .white, listenContent: sleepModesContent)
        ]
        let smallCellContent =
        [
            SmallCellContent(mainTitle: "Interesting Facts", color: UIColor(named: "deepGreen") ?? .white, listenContent: interestingFactsContent),
            SmallCellContent(mainTitle: "Proper Sleep", color: UIColor(named: "deepPink") ?? .white, listenContent: properSleepContent),
            SmallCellContent(mainTitle: "Energy Drinks", color: UIColor(named: "deepYellow") ?? .white, listenContent: energyDrinksContent),
            SmallCellContent(mainTitle: "Tips for Sleeping", color: UIColor(named: "deepBlue") ?? .white, listenContent: tipsForSleepingContent),
            SmallCellContent(mainTitle: "More Interesting Facts", color: UIColor(named: "deepRed") ?? .white, listenContent: moreInterestingFactsContent)
        ]
        let cellContent = CellContent(bigCellContent: bigCellContent, smallCellContent: smallCellContent)
        
        return cellContent
    }
}

private let sleepModesContent = ListenContent(author: "4 sleep modes", title: "Sleep Modes", images: [UIImage(named: "everyman") ?? UIImage(), UIImage(named: "dymaxion") ?? UIImage(), UIImage(named: "uberman") ?? UIImage()], sound: nil, text: """
4 sleep modes that will allow you to sleep in just a few hours a day.

1. Uberman
20-30 minutes of sleep every 4 hours = 6 rest breaks per night.

Uberman mode is very effective and has a beneficial effect on health. Thanks to him, in the morning a person feels a charge of vivacity, and at night he sees vivid interesting dreams. Many who adhere to this regimen even note that they can see lucid dreams more often.

2. Everyman
3 hours of sleep at night and 3 times of 20 minutes during the day / 1.5 hours of sleep at night and 4-5 times of 20 minutes during the day.

If you have chosen Everyman, you must set the same time interval between rest breaks. It is much easier to adapt to such a regime than to Uberman. In addition, it is many times more effective than single-phase sleep.

3. Dymaxion
30 minutes of sleep every 6 hours.

Dymaxion was invented by American inventor and architect Richard Buckminster Fuller. He was delighted with this regime and said that he had never felt more energetic. After several years of Dymaxion, doctors examined Fuller's condition and concluded that he was in excellent health. However, he had to stop this practice, as his business partners adhered to a single-phase sleep regimen.

Dymaxion is the most extreme and most productive of the polyphasic modes. But at the same time, sleep lasts only two hours a day!

4. Biphasic (biphasic)
4-4.5 hours of sleep at night and 1.5 hours of sleep during the day.

Every second student adheres to this regime. This is not very effective, but it is still better than single-phase sleep.
""")

private let tipsForSleepingContent = ListenContent(author: "Tips for Sleeping", title: "Tips", images: [UIImage(named: "son1") ?? UIImage(), UIImage(named: "son2") ?? UIImage(), UIImage(named: "zdSon") ?? UIImage()], sound: nil, text: """
Silence
Many fall asleep to the sound of the TV throughout the room. But it’s better not to distract your head with noises - even recording the sounds of nature or relaxation music. You can listen to them in the process of falling asleep, but in the middle of the night they are definitely not needed.

Coolness and freshness
Sleeping in a stuffy room is a guarantee of a headache in the morning. And the heat too. The optimum temperature is in the range of 18-20 degrees. It is better to cover yourself with a warm blanket, but sleep in a cool place.

Here I sleep
Ideally, the bedroom should be reserved for night sleep only. Not for daytime and especially not for wakefulness. If you regularly eat and watch TV in your bed, instead of sleeping, incorrect reflexes will form: the body will not expect rest, but bread and circuses.

The morning is wiser than the evening
No problematic conversations. No problem solving. Slow-wave sleep - processing of experience, introduction to long-term memory and comparison with previous data. Therefore, it often happens that the solution to a complex issue in the morning seems to come by itself.

""")

private let importanceContent = ListenContent(author: "The Importance of Sleep", title: "Facts", images: [UIImage(named: "vaj1") ?? UIImage(), UIImage(named: "vaj2") ?? UIImage(), nil], sound: nil, text: """
We often hear that you need to sleep eight hours a day. This recommendation is given by national health organizations around the world, from the British NHS to the American National Sleep Foundation. But where did this advice actually come from?
Studies conducted in different countries to determine how often diseases affect different populations come to the same conclusion: people who suffer from sleep deprivation, like those who sleep too much, are more susceptible to multiple diseases and live shorter lives on average. .
However, it is difficult to say whether sleep disturbances are the cause of diseases, or vice versa - a symptom of an unhealthy lifestyle.
"Sleep too short" usually means less than six hours, "too much sleep" is more than nine to ten hours.
Unfortunately we can't show you this part of the story due to the small size of the mobile page.
Children who have not reached puberty are usually recommended to sleep at night until 11 o'clock, and infants - up to 18 hours a day. Night sleep of teenagers is considered to be up to 10 hours.
Shane O'Mara, Professor of Experimental Brain Research at Trinity College Dublin, says that while it's difficult to definitively say whether sleep deprivation is a cause or a consequence of ill health, the two influence each other.
For example, people who do not pay enough attention to physical exercises sleep worse, because of which they have increased fatigue and, as a result, there is no energy left for playing sports - and so on.
We know that scientists have time and time again linked chronic sleep deprivation—that is, missing one or two hours of sleep for an extended period of time—to poor health: you don’t have to stay up for several days in a row to notice the negative effects of sleep deprivation.

What happens to your body when you don't get enough sleep?
Lack of sleep can lead to a number of diseases.
Findings from 153 studies involving more than five million people clearly link sleep deprivation to diabetes, high blood pressure, cardiovascular disease, coronary disease, and obesity. Studies have shown that lack of sleep for just a few nights in a row can bring a healthy person to a pre-diabetic state. Moderate sleep deprivation reduces the body's ability to control blood glucose levels.
Insufficient sleep reduces the effectiveness of vaccines, lack of sleep has a devastating effect on immunity, making us vulnerable to infections.
In one study, participants who slept less than seven hours were three times more likely to develop colds than those who slept seven or more hours.
The body of people with lack of sleep produced excessive amounts of ghrelin, the hormone responsible for the feeling of hunger, and insufficient amounts of leptin, the hormone that causes satiety, and thus increases the risk of obesity.
Sleep deprivation has also been associated with reduced brain activity and even, in the long term, dementia.
Professor O'Mara explains that toxic substances accumulate in the brain during the day and are removed during sleep. If you don't sleep long enough, your condition "resembles a mild concussion."
The impact of too much sleep is less understood, but it is also known to be associated with a number of disorders, including brain damage in older adults.
""")

private let sleepPhasesContent = ListenContent(author: "Sleep Phases", title: "What Are The Stages Of Sleep?", images: [UIImage(named: "sleepPhases1") ?? UIImage(), UIImage(named: "sleepPhases2") ?? UIImage(), nil], sound: nil, text: """
Stage 1 / N1

Stage 1 is essentially the “dozing off” stage, and it normally lasts just one to five minutes.

During N1 sleep, the body hasn’t fully relaxed, though the body and brain activities start to slow with periods of brief movements (twitches). There are light changes in brain activity associated with falling asleep in this stage.

It’s easy to wake someone up during this sleep stage, but if a person isn’t disturbed, they can move quickly into stage 2. As the night unfolds, an uninterrupted sleeper may not spend much more time in stage 1 as they move through further sleep cycles.

Stage 2 / N2

During stage 2, the body enters a more subdued state including a drop in temperature, relaxed muscles, and slowed breathing and heart rate. At the same time, brain waves show a new pattern and eye movement stops. On the whole, brain activity slows, but there are short bursts of activity5 that actually help resist being woken up by external stimuli.

Stage 2 sleep can last for 10-25 minutes during the first sleep cycle, and each N2 stage can become longer during the night. Collectively, a person typically spends about half their sleep time in N2 sleep.

Stage 3 / N3

Stage 3 sleep is also known as deep sleep, and it is harder to wake someone up if they are in this phase. Muscle tone, pulse, and breathing rate decrease in N3 sleep as the body relaxes even further.

The brain activity during this period has an identifiable pattern of what are known as delta waves. For this reason, stage 3 may also be called delta sleep or slow-wave sleep (SWS).

Experts believe that this stage is critical to restorative sleep, allowing for bodily recovery and growth. It may also bolster the immune system and other key bodily processes. Even though brain activity is reduced, there is evidence that deep sleep contributes to insightful thinking6, creativity7, and memory.

We spend the most time in deep sleep during the first half of the night. During the early sleep cycles, N3 stages commonly last for 20-40 minutes. As you continue sleeping, these stages get shorter, and more time gets spent in REM sleep instead.

REM Sleep Patterns

During REM sleep, brain activity picks up, nearing levels seen when you’re awake. At the same time, the body experiences atonia, which is a temporary paralysis of the muscles, with two exceptions: the eyes and the muscles that control breathing. Even though the eyes are closed, they can be seen moving quickly, which is how this stage gets its name.

REM sleep is believed to be essential to cognitive functions8 like memory, learning, and creativity9. REM sleep is known for the most vivid dreams, which is explained by the significant uptick in brain activity. Dreams can occur in any sleep stage, but they are less common and intense in the NREM periods.

Under normal circumstances, you don’t enter a REM sleep stage until you’ve been asleep for about 90 minutes. As the night goes on, REM stages get longer, especially in the second half of the night. While the first REM stage may last only a few minutes, later stages can last for around an hour. In total, REM stages make up around 25% of sleep in adults.
""")

private let energyDrinksContent = ListenContent(author: "How do they affect sleep", title: "Energy Drinks", images: [UIImage(named: "drink1") ?? UIImage(), UIImage(named: "drink2") ?? UIImage(), nil], sound: nil, text: """
They are no longer targeted to athletes and people looking for a mid-morning or mid-afternoon pick-me-up between meals. Energy drinks reflect a gi-normous market today, as they find their way into everyday life for many Americans, especially young adults and teens. Funny how they first emerged on the scene as “dietary supplements.” Now they seem like a revved up version of soda pop, or Coke on crack (to put it lightly).

There’s a growing movement to put warning labels on the ones that contain exorbitant amounts of caffeine (yes, more caffeine than coffee in some cases) as researchers publish a new paper on these high-octane beverages. The industry, of course, begs to differ and doesn’t want to reveal such information on its products, much less agree to warning labels.

Energy Drinks: No Limits on Caffeine
In the article online that summarized this recent brouhaha, I was surprised to learn that although the FDA limits the caffeine contents of cola-type soft drinks to 71 milligrams per 12 fluid ounces, no such limit is required on energy drinks. And between the lack of information on the label and the lack of regulation, it can be hard to know what’s in an “energy” can.

That said, at least the names of some of these drink should be a big hint: Monster, Rockstar, Tab Energy, and the ubiquitous Red Bull. My favorite, though (at least in name) has got to be either Fixx (as in Get Your Fixx) or Wired X505, which contains 505 milligrams of caffeine. That’s about twice the amount of a strong Starbucks drip. Are you shaking yet?

How Energy Drinks Affect Your Sleep
It’s certainly fair to say that energy drinks can and sometimes do serve a positive purpose in our lives when used appropriately. But they have become so mainstream that I’m afraid people drink them without knowing exactly what’s in them and whether those ingredients should be regulated in one’s diet. And I’m not just talking about the caffeine. Many of these drinks impart so much sugar that you’d be looking for another fix soon after the first one. What does that mean for a good night’s sleep? A lot.

Many people are used to watching their coffee consumption in the later parts of the day if they know it can impinge on their sleep at night. But what about energy drinks? These energy bombs do more than work against sleep; they can cause you to feel anxious, jittery, and wired and tired at the same time. If you’re addicted to them, now may be the time to take inventory and cut back.
""")

private let interestingFactsContent = ListenContent(author: "The most interesting facts about sleep", title: "Interesting Facts", images: [UIImage(named: "if1") ?? UIImage(), UIImage(named: "if2") ?? UIImage(), UIImage(named: "if3") ?? UIImage()], sound: nil, text: """
The facts about sleep

1. 12% of people dream entirely in black and white

Before colour television was introduced, only 15% of people dreamt in colour. Older people dream in black and white more often than younger people, it’s all here in this study.

Related: Does Eating Cheese Before Bedtime Really Give You Nightmares?

2. Two thirds of a cat’s life is spent asleep

This will come as no surprise to most cat owners. Every sofa is a sofa bed to them. Otherwise found on your favourite seat or computer keyboard.

Cat asleep on keyboard

 

3. A giraffe only needs 1.9 hours of sleep a day, whereas a brown bat needs 19.9 hours a day

Learn more about other animals and their sleep here, including ferrets, cheetahs, and sloths.

4. Humans spend 1/3 of their life sleeping

This obviously differs depending on the age of the human, but on average it’s around a third, which is quite a lot when you think about it.

Related: How Do Sleeping Patterns Affect Your Sport?

5. The record for the longest period without sleep is 11 days

This was set by a Californian student named Randy Gardner in 1964. This is definitely not recommended, however, as Randy experienced extreme sleep deprivation and others have died staying awake for too long.

6. It’s not uncommon for deaf people to use sign language in their sleep

There are many instances where people have reported their deaf partners or children using sign language in their sleep.

7. Dysania is the state of finding it hard to get out of bed in the morning

We’ve all no doubt found it tricky getting out of bed before, but those suffering from Dysania find it particularly difficult. It’s most likely to be a form of Chronic Fatigue Syndrome.

Struggling to get out of bed

8. Parasomnia is a term that refers to unnatural movements during your sleep

Some people have even committed crime due to parasomnia, including sleep driving and even murder.

9. The sensation of falling when half asleep and jerking yourself awake is called ‘hypnic jerks’

No one is totally sure why hypnic jerks occur but they are deemed to be perfectly healthy. However, they may be increased by anxiety, caffeine or physical activity close to bedtime. They’re more frequent in young people and decrease as we get older.

10. It’s thought that up to 15% of the population are sleepwalkers

This is according to the National Sleep Foundation. It’s also a myth that you shouldn’t wake someone who is sleepwalking.
""")

private let moreInterestingFactsContent = ListenContent(author: "The most interesting facts about sleep", title: "Interesting Facts", images: [UIImage(named: "if4") ?? UIImage(), UIImage(named: "if5") ?? UIImage(), nil], sound: nil, text: """
The facts about sleep

11. 1 in 4 married couples sleep in separate beds

Dr Sarah Brewer told us why this might actually be a good thing.

12. Sleep deprivation will kill you more quickly than food deprivation

Neither are good for you, obviously, but this article claims that sleep is actually more important than food in the short term.

Sleep deprivation can be lethal

13. Those born blind experience dreams involving things such as emotion, sound and smell rather than sight

This is a topic that is really quite interesting and the timing of the blindness in a person’s life may impact what that person dreams about. There’s plenty more on this here.

14. Within 5 minutes of waking up, 50% of your dream is forgotten

After an additional 5 minutes, 90% of recollection is gone. Sigmund Freud believed this was because dreams represent our repressed thoughts and so our brain wants to get rid of them quickly. However, it’s much more likely due to our brains simply being used much more as soon as we’re awake and so we forget much of what we’ve dreamed about.

15. Pain tolerance is reduced by sleep deprivation

This study suggests that cutting a person’s sleep in half dramatically reduces pain threshold although it’s not 100% clear why.

16. 41% of the British population sleep in the foetal position

This is from research done by Professor Chris Idzikowski, director of the Sleep Assessment and Advisory Service, though five other sleeping positions have been identified: the log, yearner, starfish, soldier, and freefaller.

17. Sleep experts have discovered a direct link between people’s favourite sleeping positions and their personalities

This is also according to Professor Idzikowski, suggesting that those who sleep in the foetal position “may appear tough but are actually sensitive souls right to their core.” See what the Professor says about the other sleep positions.

Most people sleep in the foetal position

18. Ideally, falling asleep at night should take you 10-15 minutes

If it takes you less than five minutes, chances are, you’re sleep deprived.

19. Humans are the only mammals that willingly delay sleep

How nice it must be to just go to sleep whenever and wherever you are!

20. Sleeping on your front can aid digestion

Hands should apparently be positioned above the pillow so you’re in a ‘freefall’ position, whilst laying on your left side can apparently help reduce heartburn.

21. High earners (£65 – £75,000) get the best sleep

This comes from a report by The Sleep Council. I would certainly sleep better if I earned that much money!

22. Fear is said not to be the main emotion in nightmares

Instead, researchers have found that it’s most often feelings of sadness, guilt and confusion.
""")

private let properSleepContent = ListenContent(author: "Main tasks of sleep", title: "Proper sleep", images: [UIImage(named: "properSleep1") ?? UIImage(), UIImage(named: "properSleep2") ?? UIImage(), UIImage(named: "properSleep3") ?? UIImage()], sound: nil, text: """
The three main tasks of sleep

Have you ever thought that the average person spends a third of their life sleeping? Sleep is the key to health. At this time, a number of important hormones are produced, tissue regeneration and energy replenishment occur.

Sleep has three main functions:

1. The most important is recovery. The brain is cleared of toxins, accumulated metabolic waste products (an overabundance of them leads to neurological diseases, such as Alzheimer's disease).

2. Formation of a healthy metabolism. Numerous medical studies have proven that if you sleep less than eight hours a night, energy begins to be burned from carbohydrates and protein, and not from fat. This leads to negative consequences - weight gain and loss of muscle mass. Also, lack of sleep threatens to increase insulin in the blood, which is fraught with the development of diabetes and heart disease.

3. Strengthening long-term memory. Short-term (or interrupted) sleep interferes with the ability to form memories, both physical and emotional.

How much sleep do you need per day?
Sleep is a special state of consciousness and a physiological process that is characterized by a slow reaction to the outside world and specific brain activity. It includes two phases - slow and fast.

Non-REM sleep occurs immediately after falling asleep and lasts about 90 minutes. The body relaxes, the eyes are still, you are resting.

REM sleep follows slow sleep and lasts 10-20 minutes. The body temperature and pressure rise. The body is immobilized. Eyeballs make circular movements under closed eyelids. The brain is actively working - we see dreams.

These two phases alternate with each other. With a long healthy sleep, a person goes through five complete cycles. Slow-wave sleep is gradually reduced, and fast sleep increases (from 5 minutes to an hour).

Scientists have proven that it is desirable for a healthy adult to sleep for about eight hours: 5 cycles of 100 minutes each (5x100/60=8).

Sleep also depends on age. The younger, the more time is needed for tissue growth and recovery. Newborn babies sleep more than half of the day, and older people need much less time.

What is the danger of lack of sleep?
This table shows average data. But we must not forget about the individual characteristics of each organism. How do you figure out how much sleep you need? The answer is simple - only by experience. It is important to feel your body and in no case to allow regular lack of sleep, which can lead to very bad consequences.

1. Deterioration of memory, attention, coordination and speech. According to statistics, every fifth accident occurs due to lack of sleep.

2. Weakening of immunity. During sleep, the immune system synthesizes cytokines.

3. Overeating. Lack of sleep releases ghrelin, the hunger hormone.

4. Lack of proper sleep is a catalyst for the formation of bad habits: a person is looking for external stimulants (caffeine, nicotine).

5. The development of diseases of the heart and blood vessels, diabetes.

It is worth adding that a sleepy person simply looks bad - the complexion suffers, bruises form under the eyes.

""")
