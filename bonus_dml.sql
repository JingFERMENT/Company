INSERT INTO `cities` (`name`, `zipcode`) 
VALUES
('Amiens', '80000'),
('Paris', '75000'),
('Lyon', '69000');


INSERT INTO
    `products`(
        `name`,
        `description`,
        `priceHT`,
        `weight`,
        `stock`,
        `created_at`
    )
VALUES (
        'little duck',
        'A small little yellow duck in reclycled plastic',
        30,
        500,
        30,
        NOW()    
    );