import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Exam Revision Budget",
  description: "Split your study hours like money",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
