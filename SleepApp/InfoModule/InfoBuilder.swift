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
        let listen = ListenContent(author: "authorProverka", title: "titleProverka", images: [UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage()], sound: nil, text: "textProverkatextProverkatextProverkatextProverkaextProverkatextProverkatextProverkatextProverkatextProverkatextProverkatextProverkatextProverka extProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka")
        
        let bigCellContent =
        [
            BigCellContent(mainTitle: "Важность сна", additionalTitle: "5 фактов о важности сна для здоровья", color: UIColor(named: "deepBlue-1") ?? .white, listenContent: importanceContent),
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "deepPurple-1") ?? .white, listenContent: listen),
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "iceGreen") ?? .white, listenContent: listen)
        ]
        let smallCellContent =
        [
            SmallCellContent(mainTitle: "Фазы сна", color: UIColor(named: "deepGreen") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "Режимы сна", color: UIColor(named: "deepPink") ?? .white, listenContent: sleepModesContent),
            SmallCellContent(mainTitle: "Для детей", color: UIColor(named: "deepYellow") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "Советы для хорошего сна", color: UIColor(named: "deepBlue") ?? .white, listenContent: tipsForSleepingContent),
            SmallCellContent(mainTitle: "Интересная информация", color: UIColor(named: "deepRed") ?? .white, listenContent: listen)
        ]
        let cellContent = CellContent(bigCellContent: bigCellContent, smallCellContent: smallCellContent)
        
        return cellContent
    }
}

let sleepModesContent = ListenContent(author: "4 режима сна", title: "Режимы сна", images: [UIImage(named: "everyman") ?? UIImage(), UIImage(named: "dymaxion") ?? UIImage(), UIImage(named: "uberman") ?? UIImage()], sound: nil, text: """
4 режима сна, которые позволят выспаться всего за несколько часов в сутки.

1. Uberman
20–30 минут сна каждые 4 часа = 6 перерывов на отдых в сутки.

Режим Uberman очень эффективен и благотворно отражается на здоровье. Благодаря ему утром человек чувствует заряд бодрости, а ночью видит яркие интересные сны. Многие, кто придерживается этого режима, даже отмечают, что чаще могут видеть осознанные сновидения.

2. Everyman
3 часа сна ночью и 3 раза по 20 минут в течение дня / 1,5 часа сна ночью и 4–5 раз по 20 минут в течение дня.

Если вы выбрали Everyman, необходимо установить одинаковый временной промежуток между перерывами на отдых. Приспособиться к такому режиму гораздо проще, чем к Uberman. К тому же он в разы эффективнее однофазного сна.

3. Dymaxion
30 минут сна каждые 6 часов.

Dymaxion придумал американский изобретатель и архитектор Ричард Бакминстер Фуллер. Он был в восторге от этого режима и говорил, что никогда не чувствовал себя энергичнее. Спустя несколько лет соблюдения режима Dymaxion врачи исследовали состояние Фуллера и заключили, что у него прекрасное здоровье. Однако ему пришлось прекратить эту практику, так как его бизнес-партнёры придерживались однофазного режима сна.

Dymaxion — самый экстремальный и самый продуктивный среди полифазных режимов. А ведь при этом сон длится всего два часа в сутки!

4. Biphasic (бифазный)
4–4,5 часа сна ночью и 1,5 часа сна днём.

Такого режима придерживается каждый второй студент. Это не очень эффективно, но всё же лучше однофазного сна.
""")

let tipsForSleepingContent = ListenContent(author: "Советы для хорошего сна", title: "Советы", images: [UIImage(named: "son1") ?? UIImage(), UIImage(named: "son2") ?? UIImage(), UIImage(named: "zdSon") ?? UIImage()], sound: nil, text: """
Тишина
Многие засыпают и под голосящий на всю комнату телевизор. Но правильнее всё-таки не отвлекать голову шумами — даже записью звуков природы или релаксационной музыки. Их можно слушать в процессе засыпания, но среди ночи они точно не нужны.

Прохлада и свежесть
Сон в душной комнате — гарантия головной боли наутро. И жара тоже. Оптимальная температура находится в пределах 18–20 градусов. Лучше накрыться тёплым одеялом, но спать в прохладе.

Здесь я сплю
В идеале спальня должна быть предназначена только для ночного сна. Не для дневного и тем более не для бодрствования. Если вы в своей кровати будете регулярно есть и смотреть телевизор, вместо того чтобы спать, сформируются неправильные рефлексы: организм будет ожидать не отдыха, а хлеба и зрелищ.

Утро вечера мудренее
Никаких проблемных разговоров. Никаких решений проблем. Медленный сон — переработка опыта, введение в долгосрочную память и сопоставление с прежними данными. Поэтому часто бывает так, что решение сложного вопроса с утра приходит вроде как само собой.

""")

let importanceContent = ListenContent(author: "Факты о важности сна", title: "Факты", images: [UIImage(named: "vaj1") ?? UIImage(), UIImage(named: "vaj2") ?? UIImage(), nil], sound: nil, text: """
Часто приходится слышать о том, что спать необходимо восемь часов в сутки. Такую рекомендацию дают национальные организации здравоохранения по всему миру, от британской NHS до американского Национального фонда по проблемам сна. Но откуда на самом деле взялся этот совет?
Исследования, проводимые в разных странах с целью определить, как часто болезни поражают различные группы населения, приходят к одному и тому же выводу: люди, страдающие от недосыпа, как и те, кто спит чересчур много, больше подвержены многочисленным заболеваниям и живут в среднем меньше.
Однако сложно сказать, являются ли нарушения сна причиной заболеваний, или наоборот - симптомом нездорового образа жизни.
Под "слишком коротким сном", как правило, имеется в виду меньше шести часов, "чересчур много спать" - это больше девяти-десяти часов.
К сожалению, мы не можем показать вам эту часть истории из-за малого объема мобильной страницы.
Детям, не достигшим пубертатного возраста, обычно рекомендуют спать по ночам до 11 часов, а младенцам - до 18 часов в сутки. Ночной сон тинейджеров, как считается, должен составлять до 10 часов.
Шейн О'Мара, профессор отдела экспериментальных исследований мозга в дублинском Тринити-колледже, говорит, что хотя сложно однозначно ответить, является ли недостаток сна причиной или следствием плохого состояния здоровья, два этих явления оказывают взаимное влияние друг на друга.
Например, люди, не уделяющие достаточного внимания физическим упражнениям, спят хуже, из-за чего у них повышается утомляемость и, как следствие, на занятия спортом не остается сил - и так далее.
Мы знаем, что ученые снова и снова связывают хроническую депривацию сна - то есть недосып на один или два часа в течение продолжительного периода времени - с плохим состоянием здоровья: чтобы заметить негативное влияние недосыпа, совершенно необязательно не ложиться спать несколько дней подряд.

Что происходит с вашим организмом, когда вы недосыпаете?
Недостаток сна может привести к ряду заболеваний.
Результаты 153 исследований с участием более пяти миллионов человек четко указывают на связь недостатка сна с диабетом, высоким давлением, заболеваниями сердечно-сосудистой системы, ишемической болезнью и ожирением. Исследования показали, что нехватка сна в течение всего лишь нескольких ночей подряд может довести здорового человека до преддиабетического состояния. Умеренный недосып снижает способность организма контролировать уровень глюкозы в крови.
При недостаточном сне снижается эффективность вакцин, недосыпание разрушительным образом сказывается на иммунитете, делая нас уязвимыми для инфекций.
В ходе одного из исследований участники, сон которых составлял менее семи часов, были в три раза более подвержены простудным заболеваниям, чем те, кто спал семь и больше часов.
Организм людей с недостатком сна производил избыточное количество грелина - гормона, отвечающего за возникновения чувства голода, и недостаточное количество лептина - гормона, вызывающего насыщение, а таким образом повышается риск ожирения.
Также отмечена связь недосыпа с пониженной мозговой активностью и даже, в отдаленной перспективе, слабоумием.
Профессор О'Мара поясняет, что токсичные вещества накапливаются в мозге в течение дня и удаляются во время сна. Если вы спите недостаточно долго, ваше состояние "напоминает легкое сотрясение мозга".
Влияние слишком продолжительного сна изучено меньше, но известно, что он также связан с рядом расстройств, включая нарушение мозговой деятельности у людей старшего возраста.
""")
