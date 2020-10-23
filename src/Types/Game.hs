module Types.Game (
  Stone,
  Cell,
  Board,
  Player,
  Step,
  GameState,
  initialState
) where

data Stone = White | Black
  deriving (Eq,Show,Read,Enum)


data Cell = Stone | Empty
  deriving (Eq,Show,Read,Enum)


data Board = Board [[Cell]] 
             deriving (Eq,Show,Read)


data Player = Player
  { name :: Stone     -- цвет камней игрока (белые/черные)
  , stones :: Int     -- число камней у игрока 
  , captured :: Int   -- число захваченных камней соперника
  } deriving (Eq,Show,Read)


data Step = Step      -- текущий шаг 
  { stone :: Stone
  , x :: Int
  , y :: Int
  } deriving (Eq, Show, Read)


data GameState = GameState
  { board :: Board
  , players :: [Player]
  , step :: Step
  } deriving (Eq, Show, Read)

n = 19

generateRow = Empty : generateRow 
generateLine = (take n $ generateRow) : generateLine
generateBoard = take n $ generateLine

initialState :: GameState
initialState = GameState 
    { board = Board (generateBoard) 
    , players = [Player White 361 0
                , Player Black 361 0]
    , step = Step White (-1) (-1)
    }