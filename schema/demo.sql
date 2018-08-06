USE ecsc;

INSERT INTO notifications(content, category) VALUES("Competition has officially started. Good luck and have fun!", "light");
INSERT INTO contracts(title, description, categories) VALUES("Secret messages", "A mysterious message has appeared in your inbox. Can you decode it?", "Crypto");
INSERT INTO tasks(contract_id, title, description, answer, cash, awareness) VALUES((SELECT MAX(contract_id) FROM contracts), "Looks like junk mail?", "The message just says <code>Rm9sbG93IHRoZSB3aGl0ZSByYWJiaXQ=</code>", "Follow the white rabbit", 10, 15);
INSERT INTO tasks(contract_id, title, description, answer, cash, awareness) VALUES((SELECT MAX(contract_id) FROM contracts), "Another message, different sender", "This time, it says <code>Enoovg pbafcvenpl</code>", "Rabbit conspiracy", 20, 35);
INSERT INTO contracts(title, description, categories) VALUES("Emergency response", "Someone needs help <u>fast</u>! The cash payout for this contract reduces by 2,000 every half an hour once you accept it.", "Reverse-engineering,Forensics,Act fast");
INSERT INTO tasks(contract_id, title, description, answer, cash, awareness) VALUES((SELECT MAX(contract_id) FROM contracts), "Investigate the binary", "We think the attached <a href='/files/dummy.txt'>binary</a> is malware. Find the domain it uses for command-and-control.", "foobar", 10000, 5);
INSERT INTO contracts(title, description, categories) VALUES("Charity pentest", "Help a charity to secure their website. They've not got a lot of money, but it's a good thing to do!", "Web");
INSERT INTO tasks(contract_id, title, description, answer, cash, awareness) VALUES((SELECT MAX(contract_id) FROM contracts), "Website pentest", "Charity BlahBlah has recently built their own <a href='http://testphp.vulnweb.com/'>website</a>. They want to make sure that it's safe from amateur hackers and won't be defaced.", "foobar", 1000, 10);
INSERT INTO contracts(title, description, categories) VALUES("Hack the hacker", "We need you for your offensive skills", "Web");
INSERT INTO tasks(contract_id, title, description, answer, cash, awareness) VALUES((SELECT MAX(contract_id) FROM contracts), "Hack this site", "You know the drill. The target is <code>evil-attacker.com</code>", "foobar", 40000, 0);
INSERT INTO constraints(contract_id, min_cash, min_awareness) VALUES((SELECT MAX(contract_id) FROM contracts), NULL, 10);

INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("plaid", "Plaid Parliament of Pwning", "US", "foobar@foobar.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("tokyo", "TokyoWesterns", "JP", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("cykor", "CyKOR", "KR", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("p4", "P4", "PL", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("dcua", "DCUA", "UA", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("bushwhackers", "Bushwhackers", "RU", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("r00t", "0x90r00t", "FR", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("0daysober", "0daysober", "CG", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("epicleet", "Epic Leet Team", "BR", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("balsn", "Balsn", "TW", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
INSERT INTO teams(login_name, full_name, country_code, email, password_hash) VALUES("greunion", "greunion", "GR", "cn@hack.com", "$2y$10$0Yc0b.xecXY/UMaZvzSnQuv/ur1oX3cQif09rqAp2eW6yJPlHRNV2");  -- - <?php echo password_hash("passw0rd", PASSWORD_BCRYPT); ?>
