import Placeholder1 from "@/assets/placeholders/bear-1.png";
import Placeholder2 from "@/assets/placeholders/bear-2.png";
import Placeholder3 from "@/assets/placeholders/bear-3.png";

export const config: Config = {
  // Removing one or all of these socials will remove them from the page
  socials: {
    twitter: "https://twitter.com/kunaldhongade",
    discord: "https://discord.com",
    homepage: "https://kunaldhongade.vercel.app",
  },

  defaultCollection: {
    name: "Lorem Ipsum",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris congue convallis augue in pharetra.",
    image: Placeholder1,
  },

  ourStory: {
    title: "Our Story",
    subTitle: "Innovative Scholarship Platform on Aptos",
    description:
      "Welcome to Aptos Scholarships, where we bridge the gap between ambition and opportunity. Our blockchain-powered scholarship platform revolutionizes how students and donors connect, ensuring transparency, security, and fairness in the distribution of educational funds. Join us and be a part of a community committed to fostering the leaders of tomorrow.",
    discordLink: "https://discord.com",
    images: [Placeholder1, Placeholder2, Placeholder3],
  },

  ourTeam: {
    title: "Our Team",
    members: [
      {
        name: "Kunal",
        role: "Blockchain Developer",
        img: Placeholder1,
        socials: {
          twitter: "https://twitter.com/kunaldhongade",
        },
      },
      {
        name: "Soham",
        role: "Marketing Specialist",
        img: Placeholder2,
      },
      {
        name: "Amrita",
        role: "Community Manager",
        img: Placeholder3,
        socials: {
          twitter: "https://twitter.com",
        },
      },
    ],
  },

  faqs: {
    title: "F.A.Q.",

    questions: [
      {
        title: "Is this project is Free for creator and applicant?",
        description:
          "Yesss! This project is completely Free to use and you can create as many scholarships as you want.",
      },
      {
        title: "How To Create Scholarships brief info?",
        description:
          "To Create Scholarship You first Need to initialized scholarships from Scholarship Provider Dashboard and then you can create scholarships. by filling the form and submitting it. Make sure to fill the form correctly it not reversible.",
      },
      {
        title: "How Distribution of scholarship works?",
        description:
          "Its really simple that you thing!, Once you successfully applied to scholarship and your GPA is above the required GPA you will get the scholarship amount in your account.",
      },
      {
        title: "How how can i get my money back after scholarship?",
        description:
          "You will get your full refund if you close your scholarship or after distribution of scholarship you will get remaining funds.",
      },
      {
        title: "What if I want to close scholarship due to some reason?",
        description:
          "We kept that in our mind while building this awesome project you can close your scholarships you have created and after that you will get your funds back to your account.",
      },
    ],
  },

  nftBanner: [Placeholder1, Placeholder2, Placeholder3],
};

export interface Config {
  socials?: {
    twitter?: string;
    discord?: string;
    homepage?: string;
  };

  defaultCollection?: {
    name: string;
    description: string;
    image: string;
  };

  ourTeam?: {
    title: string;
    members: Array<ConfigTeamMember>;
  };

  ourStory?: {
    title: string;
    subTitle: string;
    description: string;
    discordLink: string;
    images?: Array<string>;
  };

  faqs?: {
    title: string;
    questions: Array<{
      title: string;
      description: string;
    }>;
  };

  nftBanner?: Array<string>;
}

export interface ConfigTeamMember {
  name: string;
  role: string;
  img: string;
  socials?: {
    twitter?: string;
    discord?: string;
  };
}
