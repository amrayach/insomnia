ArrayList<Thought> thoughts;
int maxThoughts = 50;
String[] thoughtTexts = {
  "Why is the sky blue?", "What if cats ruled the world?", "I need to buy milk", 
  "Is time travel possible?", "I forgot to send that email!", "Pineapple on pizza?", 
  "Are we alone in the universe?", "I should start exercising", "Do fish ever get thirsty?", 
  "What's the meaning of life?", "Need to charge my phone", "Why do we dream?",
  "Maybe I should learn guitar", "Do penguins have knees?", "I wonder how mirrors work", 
  "Should I start a blog?", "What's on TV tonight?", "I miss my old cartoons", 
  "How do they put stripes in toothpaste?", "Why can't dogs talk?", "What if I was a superhero?",
  "Can a machine think?", "What's the sound of one hand clapping?", "Is the universe infinite?",
  "What if we could breathe underwater?", "How does a bee see the world?", "Is laughter contagious?",
  "Why do we forget dreams?", "What if gravity was optional?", "Is there life on other planets?",
  "How many languages can one learn?", "What's at the end of a rainbow?", "Why is pizza round?",
  "Can we live on Mars?", "What if we could teleport?", "Do animals have a sense of humor?",
  "What if every day was a weekend?", "How do birds not get lost?", "Are robots our future?",
  "What if trees could walk?", "Why is ice slippery?", "Do stars have a sound?",
  "What if we had tails?", "Can plants feel pain?", "Is time an illusion?",
  "Why do we yawn?", "What's inside a black hole?", "Do dreams have meanings?",
  "Is there a parallel universe?"
};

void setup() {
  fullScreen(); // Set to full-screen mode
  thoughts = new ArrayList<Thought>();
}

void draw() {
  background(0); // Dark background for night

  if (thoughts.size() < maxThoughts) {
    thoughts.add(new Thought());
  }

  for (int i = thoughts.size() - 1; i >= 0; i--) {
    Thought t = thoughts.get(i);
    t.move();
    t.display();
    if (t.size > 150) { // Adjusted max size before removal
      thoughts.remove(i);
    }
  }
}

class Thought {
  float x, y;
  float xSpeed, ySpeed;
  float size;
  color col;
  String text;

  Thought() {
    x = random(width);
    y = random(height);
    xSpeed = random(-1, 1); // Slower horizontal movement
    ySpeed = random(-1, 1); // Slower vertical movement
    size = random(20, 50); // Larger initial size
    col = color(random(100, 255), random(100, 255), random(100, 255), random(50, 150));
    text = thoughtTexts[int(random(thoughtTexts.length))];
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
    size += 0.5; // Slower size growth
    if (x < 0 || x > width) xSpeed *= -1;
    if (y < 0 || y > height) ySpeed *= -1;
  }

  void display() {
    fill(col);
    noStroke();
    ellipse(x, y, size, size);

    fill(255);
    textAlign(CENTER, CENTER);
    textSize(min(size / 3, 24)); // Larger text size
    text(text, x - size/2, y - size/2, size, size); // Position text inside the bubble
  }
}