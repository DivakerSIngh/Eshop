(function () {
    "use strict";

    $(".js--panel").addClass('animated fadeInUp');

    $(".logo-black.js--wp-1").addClass('animated fadeInRightBig');
    $('.faqqs').click(function (e) {
        e.preventDefault();
        if ($(this).text() === 'Pricing') {
            $('.modal-header h4').text('Pricing');
            $('#modalContent').html('<h2>PRICING</h2><p>We make the fastest payments in the industry. Based on your performance tier, you get paid within the next `-15 business days from the date of order dispatch. It\'s 7 business days for Gold Sellers, 12 business days for Silver Sellers and 15 business days for Bronze sellers. You decide the price of your products and we charge you a small fee on the successful orders you make.</p><div style="text-align:center"><h2>PRICING STRUCTURE</h2><h4>SETTLEMENT AMOUNT</h4><h6>The amount credited to your bank account within 7-14 business days of dispatch</h6><h4>ORDER ITEM VALUE</h4><h6>Selling price and Shipping charge paid by customer and excludes discount offered by Seller</h6><h4>MARKETPLACE FEE</h4><h6>Includes shipping fee, fixed fee and selling commission</h6><h4>SERVICE TAX With GST</h4><h6>18% of Marketplace Fee including Swachh Bharat &amp; Krishi Kalyan cess)</h6><h4>Commission fee</h4><h6>Percentage of Order item value ( depends on category & sub-category)</h6><h4>Shipping fee</h4><h6>Calculated on the basis of product weight and shipping location</h6><h4>Collection fee</h4><h6>Payment gateway or cash collection charges for every sale</h6><h4>Fixed fee</h4><h6>A small fee that Flipkart charges on all transactions</h6></div><h3>Here’s an easy example, which illustrates a sample the above calculation</h3><div style="text-align:center"><table class="table"><thead><tr class="success"><th>ITEM</th><th>AMOUNT (RS.)</th></tr></thead><tbody><tr class="success"><td>Selling Price (decided by you)</td><td>1500</td></tr><tr class="success"><td>Commission Fee (varies across sub-categories/verticals)</td><td>150 (assuming 10%)</td></tr><tr class="success"><td>Shipping Fee (Local shipping , weight 500 grams)</td><td>30</td></tr><tr class="success"><td>Collection Fee (2 % on the Order item value)</td><td>30</td></tr><tr class="success"><td>Fixed Fee</td><td>30</td></tr><tr class="success"><td>Total Marketplace Fee</td><td>240</td></tr><tr class="success"><td>Service Tax (15% of Marketplace Fee including Swachh Bharat & Krishi Kalyan cess)</td><td>36</td></tr><tr class="success"><td>Total deductions</td><td>276</td></tr><tr class="success"><td>Settlement Value(Amount credited to you)</td><td>1224</td></tr></tbody></table></div><h2>Shipping Fee</h2><p>To ensure ease of selling and the best possible customer experience, we mandate delivery to all customers via our logistics partners and deduct the shipping cost from the selling price before making a payment to you</p><p>Shipping fee is calculated on actual weight or volumetric weight, whichever is higher. This is to account for items which are lightweight but occupy a lot of shipping space.</p><p>Volumetric weight is calculated as below</p><p>\"Volumetric Weight (kg) = L*B*H (Length x Breadth x Height)\/5000 where LBH are in cm\"</p><p>Every new seller will be tiered as a Bronze seller. Basis set performance metrics, the seller can move to Silver or Gold tier during the quarterly refresh</p><p>The below shipping rate for forward shipments is applicable for Bronze Sellers only. There is 20% and 10% discount on the forward shipping fee for Gold and Silver Sellers respectively</p><p>The following rates are exclusive of all taxes</p><div style=\"text-align: center\"><table class=\"table newTable\"><thead><tr class=\"success\"><th>WEIGHT SLAB</th><th>LOCAL (INTRACITY) IN RS.</th><th>ZONAL (INTRAZONE) IN RS</th><th>NATIONAL (INTERZONE) IN RS</th></tr></thead><tbody><tr class=\"success\"><td>0.0 Kg - 0.5 Kg ( For every 0.5 kg )</td><td>30</td><td>50</td><td>70</td></tr><tr class=\"success\"><td>0.5 Kg - 5.0 Kg ( For every 0.5 kg )</td><td>30</td><td>35</td><td>45</td></tr><tr class=\"success\"><td>&gt; 5.0 Kg ( For every 1 kg )</td><td>5</td><td>10</td><td>20</td></tr></tbody></table></div><br><div><span style=\"font-weight:bold\">Local (Intracity):</span><span>Item shipped within a city</span></div><br><div><span style=\"font-weight:bold\">Zonal (Intrazone):</span><span>Item shipped within the borders of a zone (North, South, East, West)</span></div><br><div><span style=\"font-weight:bold\">National (Interzone):</span><span>Item shipped across zones</span></div>');
        } else if ($(this).text() === 'FAQ') {
            $('.modal-header h4').text('FAQ');
            $('#modalContent').html('<h2>GETTING STARTED</h2><h3>Why should I sell on Villagers?</h3><p>Villagers is tech start-up in Indian e-commerce with maximum online reach and highest credibility. With more than 1 crore registered customers and we are the strongest partner to take your products to customers all over India</p><h3>Who can sell on Villagers?</h3><p>Anyone selling new and genuine products is welcome. In order to start selling, you need to have the following:<ul><li>PAN Card (Personal PAN for business type “Proprietorship” and Personal + Business PAN for business type as “Company”)</li><li>VAT/TIN Number </li><li>Bank account and supporting KYC documents (Address Proof, and Cancelled cheque)</li><li>Minimum of 10 unique products to sell</li></ul></p><h3>How do I sell on Villagers?</h3><p>To sell on Villagers:</p><ol><li>Register yourself at <a href="http://www.villagers.online">www.villagers.online </a></li><li>List your products under specific product categories</li><li>Once an order is received, pack the product and mark it as ‘Ready to Dispatch’. Our logistics partner will pick up the product and deliver it to the customer</li><li>Once an order is successfully dispatched, Villagers will settle your payment within 7-14 business days</li></ol><h3>Can I offer both products and services on Villagers?</h3><p>Currently, you can sell only products and not services on Villagers</p><h3>Do I need to courier my products to Villagers?</h3><p>No, Villagers will handle shipping of your products. All you need to do is pack the product and keep it ready for dispatch. Our logistics partner will pick up the product from you and deliver it to the customer</p><h3>What are the documents required to register as a seller on Villagers?</h3><p>You are required to have the following documents:</p><ul><li>PAN Card(Personal PAN for business type “Proprietorship” and Personal + Business PAN for business type as “Company”)</li><li>VAT/TIN Number (not mandatory for books</li><li>Bank account and supporting KYC documents ( Address Proof, and Cancelled Cheque)</li></ul><h3>I do not have a TIN/VAT; can I still register as a seller with only PAN?</h3><p>If you want to sell any other product, you will mandatorily require a VAT/TIN</p><h3>Who decides the price of the products?</h3><p>As a seller, you will set the price of your products.</p><h3>Will I get charged for listing products on Villagers?</h3><p>No. Listing of products on Villagers.com is absolutely free. Villagers does not charge anything for listing your catalogue online. You only pay a small commission for what you sell</p><h3>Who takes care of the delivery of my products?</h3><p>Our logistics partner will pick up the product from you and deliver it to the customer. All you need to do is keep it packed and ready for dispatch</p><h3>How and when will I get paid?</h3><p>The payment will be made directly to your bank account through NEFT transactions within 7-14 business days of dispatching an order. The actual payment period will vary depending on how long you have been selling at Villagers, your customer ratings and number of orders fulfilled</p><h3>When can I start selling?</h3><p>After all the required documents have been verified and your seller profile is complete, you can start listing your products and start selling</p><h3>How many listings are required to start selling?</h3><p>You are required to have a minimum of 10 listings ( unique products) to start selling on Villagers</p><h2>PRICING AND PAYMENTS</h2><h3>Who decides the price of the product?</h3><p>As a seller, you will set the price of your products</p><h3>What are the fees charged?</h3><p>The following deductions are made from the order item value:</p><ul><li>Commission fee: A percentage of the order item value vary based on vertical/sub-category</li><li>Shipping fee (calculated on the basis of the product weight, shipping location and )</li><li>Collection fee: This will vary based on order item value and customer payment mode (Prepaid/Cash on Delivery)</li><li>Fixed fee: A slab wise Fixed fee. This vary based on Order item value</li><li>Service tax (applicable on all of the above components)</li></ul><h3>What is Commission fee and how much commission is charged?</h3><p>Commission fee is a certain percentage of the order item value of your product. It differs across categories and vertical/sub-categories</p><h3>Please give an example to show the cost calculation</h3><h3>Here’s an easy example, which illustrates a sample the above calculation:</h3><table class="table"><thead><tr class="success"><th>ITEM</th><th>AMOUNT (RS.)</th></tr></thead><tbody><tr class="success"><td>Selling Price (decided by you)</td><td>1500</td></tr><tr class="success"><td>Commission Fee (varies across sub-categories/verticals)</td><td>150 ( assuming 10% )</td></tr><tr class="success"><td>Shipping Fee (Local shipping , weight 500 grams)</td><td>30</td></tr><tr class="success"><td>Collection Fee ( 2 % on the Order item value)Collection Fee ( 2 % on the Order item value)</td><td>30</td></tr><tr class="success"><td>Fixed Fee</td><td>30</td></tr><tr class="success"><td>Total Marketplace Fee</td><td>240</td></tr><tr class="success"><td>Service Tax (15% of Marketplace Fee including Swachh Bharat & Krishi Kalyan cess)</td><td>36</td></tr><tr class="success"><td>Total deductions</td><td>276</td></tr><tr class="success"><td>Settlement Value (Amount credited to you)</td><td>1224</td></tr></tbody></table><h3>How and when do I get paid?</h3><p>All payments are made through NEFT transactions (online banking). The payment is made directly to your bank account within the next 7-15 business days from the date of order dispatch. It\'s 7 business days for Gold Sellers, 12 business days for Silver Sellers and 15 business days for Bronze sellers</p><h2>LISTINGS AND CATALOG</h2><h3>What is listing?</h3><p>Listing a product refers to filling out all the necessary information and adding images of the product so that a customer can make an informed buying decision</p><h3>How many products do I need to list to start selling?</h3><p>You are required to have a minimum of 10 listings to start selling on Villagers.com.</p><h3>How do I list my products on Villagers?</h3><p>We give you a step-by-step process of how to list your products on our website. It is important to choose the most suitable category to list your product as it will help customers find your products faster. Based on the category you choose, you\'ll be asked to include product details such as size, model, color, etc</p><h3>Can I get help for development of catalog (product images, description, etc.)?</h3><p>Yes, we are happy to help you at every stage while doing business with us. We help you connect with industry experts for the development of your catalogs. With the help of our catalog partners across India, you can have attractive images and crisp content developed at unbeatable prices</p><h3>How does a catalog partner help me?</h3><p>Our catalog partners develop high-quality photographs of your products and crisp product descriptions for your product catalog. A good catalog gives your customers a better understanding of your products and helps boost your sales.</p><h3>How do I price my products?</h3><p>When pricing products on Villagers, please account for the applicable Marketplace Fee and include a suitable margin to arrive at the Selling Price. For ease of calculation, you can use our Commission Calculator widget once on boarded</p><h3>Will I get charged for listing products on Villagers?</h3><p>No. Listing of products on Villagers.com is absolutely free. Villagers does not charge anything to you for listing your catalogue online. You only pay a small commission for what you sell</p><h2>ORDER MANAGEMENT AND SHIPPING</h2><h3>Who takes care of the delivery of my products?</h3><p>Our logistics partner will pick up the product from you and deliver it to the customer. All you need to do is keep it packed and ready for dispatch</p><h3>What should I do if my area is not serviceable by Villagers?</h3><p>During registring, save the details of your pin code and click on the Continue button. You will be notified via e-mail when your pin code becomes serviceable</p><h3>How do I manage my orders on Villagers?</h3><p>Through our seller dashboard, we make it really easy for you to manage your orders. Whenever a customer places an order, we send you an e-mail alert. You need to pack the order and keep it ready for dispatch within the time frame provided by you and inform us through the seller portal. This will alert our logistics partner to pick up the product from you.</p><h3>Does Villagers provide packaging material?</h3><p>We have a strong network of best packaging material providers in the industry. We can connect you with them to get good quality packaging material which impresses the customers and ensures your products remain undamaged</p><h2>RETURNS AND SELLER PROTECTION</h2><h3>What protection does Villagers offer in case of lost/damaged goods and fraudulent customer claims?</h3><p>Villagers has set up a Seller Protection Fund (SPF) to protect our sellers against fraud. You can request for SPF claim through the seller dashboard. When the buyer or logistics partner is at fault, you will receive due compensation</p><h3>Would I get compensation if the customer has returned damaged products?</h3><p>Yes, you can raise a claim through Seller Protection Fund. Depending on the case and category, you will be given a refund provided you have adequate proof that you shipped an authentic/undamaged product. This will help us close the dispute in your favour</p><h3>Would I get compensation if the customer has replaced the original product with a different item?</h3><p>Yes, you can raise a claim through Seller Protection Fund. Depending on the case and category, you will be given a refund provided you have adequate proof that you shipped the right product. This will help us close the dispute in your favour.</p><h3>Would I get compensation if the goods are damaged or lost in transit?</h3><p>Yes. When your products are damaged in transit, you can raise a claim under the Seller Protection Fund. The refund depends on the scenario and product.</p>');
        } else {
            $('.modal-header h4').text('Benefits');
            $('#modalContent').html('<h2>Cataloging</h2><h3>The art of selling smart</h3><p>Customers always choose to buy products that look the best and have the most accurate descriptions. We help you attract customers with smart cataloging. Get attractive images and clear description of your products and grab customers’ attention</p><h4>Our catalog partners in 30+ cities provide you with:</h4><ul><li>Quick design and development of your catalogs</li><li>Best quality images</li><li>Clear and complete description of your products</li><li>Catalog that prompts quick buying decision</li></ul><br><p>You receive expert cataloging solutions from professionals who assist you in creating best product catalogs.</p><h2>Easy pick-up and delivery</h2><h3>Delivering your products to 1000+ cities</h3><p>Our ever-growing logistics network ensures faster delivery of your products across India. Your customers get great service and you get better ratings.</p><h4>Our logistics network:</h4><ul><li>Ensures smooth pick-up and delivery of your products</li><li>Superior experience for your customers</li><li>Effortless order fulfilment through 120+ pick-up hubs and 10,000+ delivery personnel</li></ul><br><p>Our logistics network is one of the largest in the industry and growing. Come onboard and sell to crores of customers.</p><h2>FASTER PAYMENTS</h2><h3>Your earnings don’t keep you waiting</h3><p>Re-invest profits to generate more business without any delay. At Villagers, you get your payments within 5-7 business days of dispatching an order. The payment is made directly to your bank account, thus making the whole process fast and easy.</p><h4>Easy and fast payment process. You get:</h4><ul><li>Fastest payment for fulfilled orders</li><li>Quick re-investing opportunities</li><li>Detailed information on payment settlement on seller dashboard</li></ul><br><p>Experience smooth cash flow. Start selling on Villagers and grow your business with the fastest payment cycle in the industry.</p><h2>VILLAGERS GROWTH CAPITAL</h2><h3>Get funds for your business the Villagers Style</h3><p>With Growth Capital, we provide you with convenient access to financial assistance for your business needs. Through our network of trusted partners, you will get access to capital at competitive rates, with zero collateral and quick turnaround time.</p><h4>With Growth Capital you can:</h4><ul><li>Get financial assistance for your business from our trusted partners</li><li>Buy more inventory and enhance your listings</li><li>Invest in building your brand</li><li>Grow your business faster on Villagers</li></ul><br><p>That’s getting funds for business the Villagers way - no hassle, minimum documentation, maximum benefits.</p><h2>TRAINING</h2><h3>Learn the art of selling online</h3><p>Set aside your concerns about being skilled to sell online. Through our specially designed training program, you can master the art of selling online through Villagers and growing your business by leaps and bounds. The training program covers various topics like cataloging, order fulfilment, and merchandising.</p><h4>Come onboard and be a master of online selling:</h4><ul><li>Know the whole process of selling on Villagers</li><li>Get training to list products and fulfill orders with ease</li><li>Learn the best practices in e-commerce and selling online</li></ul><br><p>To help you become skilled at selling online is our job. Register your business today to sell your products online on Villagers.</p><h2>SMART FULFILMENT</h2><h3>Get more business with less effort</h3><p>At Villagers, we promise you maximum returns with minimum investment. That’s why the Smart Fulfilment service offers you the use of our state-of-the-art fulfilment centres at very low costs. You store your products in our fulfilment centres where we take utmost care of your inventory.</p><h4>What does Smart Fulfilment offer?</h4><ul><li>Fulfilment centre space</li><li>Faster delivery of your products</li><li>Quality check of your products by our experts</li><li>Packaging that will delight your customers</li></ul><br><p>Take your business to the next level with Smart Fulfilment on Villagers.</p>');
        }
        $('#myModal88').modal();
    });

    //login form
    $.validator.addMethod("customemail",
    function (value, element) {
        return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
    },
    "Please Enter Valid Email"
);

   
    $(document).on('focus', ':input', function () {
        $(this).attr('autocomplete', 'off');
    });
    $('#ContentPlaceHolder1_cbRCategory input').addClass('require-one');

    //Retailer Form

    $.validator.addMethod('selectcheck', function (value) {
        return (value != 'Select');
    }, "Retailer Type required");

    $.validator.addMethod('pincode', function (value) {
        if (stndis[value])
            return true;
        else
            false;
    }, "Enter Valid Pincode");
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
'Must not start with 0.');
    $.validator.addMethod('alpha', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must contain alphabets only');
    $.validator.addMethod('regexe', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must contains only number');
    $.validator.addMethod('alphanum', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Not a valid IFSC');
    //$('#f1').validate().destroy();
    $("#f1").validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtRName: {
                required: true,
                minlength: 3,
                alpha: /^[a-zA-Z\s]+$/
            },
            ctl00$ContentPlaceHolder1$txtREmail: {
                required: true,
                customemail: true,
            },
            ctl00$ContentPlaceHolder1$txtMobile: {
                required: true,
                minlength: 10,
                maxlength: 10,
                number: true,
                regex: /^[^0]\d*$/
            },
            ctl00$ContentPlaceHolder1$txtGST: {
                required: true,
            },
            ctl00$ContentPlaceHolder1$txtPincode: {
                required: true,
                pincode: true
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                required: true,
                minlength: 3
            },
            ctl00$ContentPlaceHolder1$txtRAddress: {
                required: true,
                minlength: 3
            },
            ctl00$ContentPlaceHolder1$ddlRType: {
                selectcheck: true
            },
            ctl00$ContentPlaceHolder1$txtState: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtDistrict: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtOrgName: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtOrgRegNum: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtTINNum: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtServiceNum: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtAccNum: {
                required: true,
                minlength: 9,
                maxlength: 18,
                number: true,
                regexe: /\d*$/,
            },
            ctl00$ContentPlaceHolder1$txtAHolderName: {
                required: true,
                alpha: /^[a-zA-Z\s]+$/
            },
            ctl00$ContentPlaceHolder1$txtIFSCcode: {
                required: true,
                alphanum: /^[A-Z]{4}0\d{6}$/
            },
            ctl00$ContentPlaceHolder1$txtBankName: {
                required: true,
                alpha: /^[a-zA-Z\s]+$/
            },
            ctl00$ContentPlaceHolder1$txtPAN: {
                required: true
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtGST: {
                required: "This field is required",
            },
            ctl00$ContentPlaceHolder1$txtRName: {
                required: "This field is required",
                minlength: "Must Be 3 Characters Long"
            },
            ctl00$ContentPlaceHolder1$txtREmail: {
                required: "This field is required",
                customemail: "Please Enter Valid Email"
            },
            ctl00$ContentPlaceHolder1$txtMobile: {
                required: "This field is required",
                minlength: "Enter Valid Mobile No",
                maxlength: "Enter Valid Mobile No",
                number: "Please Enter Valid Digits"
            },
            ctl00$ContentPlaceHolder1$txtPincode: {
                required: "This field is Required",
                pincode: "Please Enter Valid Pincode"
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                required: "This field is required",
                minlength: "Must Be 3 Characters Long"
            },
            ctl00$ContentPlaceHolder1$txtRAddress: {
                required: "This field is required",
                minlength: "Must Be 3 Characters Long"
            },
            ctl00$ContentPlaceHolder1$ddlRType: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtState: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtDistrict: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtOrgName: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtOrgRegNum: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtTINNum: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtServiceNum: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtAccNum: {
                required: "This field is required",
                minlength: "Must be from 9 to 18 length",
                maxlength: "Must be from 9 to 18 length",
                number: "Not a valid Account Number"
            },
            ctl00$ContentPlaceHolder1$txtAHolderName: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtIFSCcode: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtBankName: {
                required: "This field is required"
            },
            ctl00$ContentPlaceHolder1$txtPAN: {
                required: "This field is required"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtGST: {
                placement: 'top',
            },
            ctl00$ContentPlaceHolder1$txtRName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtREmail: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtMobile: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtPincode: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtRAddress: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$ddlRType: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtState: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtDistrict: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtOrgName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtOrgRegNum: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtTINNum: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtServiceNum: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtAccNum: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtAHolderName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtIFSCcode: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtBankName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtPAN: {
                placement: 'top'
            }
        }
    });



    $('#ContentPlaceHolder1_txtState').attr('disabled', 'disabled');
    $('#ContentPlaceHolder1_txtPincode').on('keyup blur', function () {
        if ($(this).val().length === 6) {
            $('#ContentPlaceHolder1_txtState').val(stndis[$(this).val()].state);
            $('#ContentPlaceHolder1_txtDistrict').val(stndis[$(this).val()].district);
        }
        else {
            $('#ContentPlaceHolder1_txtState').val('');
            $('#ContentPlaceHolder1_txtDistrict').val('');
        }
    });
    $('#ContentPlaceHolder1_btnRetSubmit').click(function (e) {
        if ($('.require-one:checkbox:checked').size() === 0) {
            $('#ContentPlaceHolder1_cbRCategory').parent().after('<div class="tooltip fade top in" role="tooltip" id="tooltip338720" style="left: 35%; display: block;"><div class="tooltip-arrow" style="left: 50%;"></div><div class="tooltip-inner">Please check at least one box.</div></div>');
        }
        if (!$('#f1').valid()) {
            e.preventDefault();
        }
        else {
            $('#ContentPlaceHolder1_btnRetSubmit').val('Submitting...').attr('class', 'btn btn-primary disabled');
        }
    });
    $('.require-one:checkbox').on('click', function () {
        if ($('.require-one:checkbox:checked').size() > 0) {
            $("#tooltip338720").remove();
        }
        else {
            $('#ContentPlaceHolder1_cbRCategory').parent().after('<div class="tooltip fade top in" role="tooltip" id="tooltip338720" style="left: 35%; display: block;"><div class="tooltip-arrow" style="left: 50%;"></div><div class="tooltip-inner">Please check at least one box.</div></div>');
        }
    });


    //Create Employee Form

    $("#createEmpForm").validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtName: {
                required: true,
                minlength: 2
            },
            ctl00$ContentPlaceHolder1$txtAddress: {
                required: true,
                minlength: 2
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                required: true,
                minlength: 6
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                required: true,
                customemail: true
            },
            ctl00$ContentPlaceHolder1$txtMob: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 10
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtName: {
                required: "This field is required",
                minlength: "Name must be 2 characters long"
            },
            ctl00$ContentPlaceHolder1$txtAddress: {
                required: "This field is required",
                minlength: "Name must be 2 characters long"
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                required: "This field is required",
                minlength: "Password must be 6 characters long"
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                required: "This field is required",
                customemail: "Not a valid Email"
            },
            ctl00$ContentPlaceHolder1$txtMob: {
                required: "This field is required",
                number: "Not a valid Number",
                minlength: "Not a valid Number",
                maxlength: "Not a valid Number"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtAddress: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtMob: {
                placement: 'top'
            }
        }
    });
    $('#createEmpForm #ContentPlaceHolder1_btnSave').click(function (e) {
        if (!$('#createEmpForm').valid()) {
            e.preventDefault();
        }
    });

    //  Logistic Form 

    $("#logisticInfoForm").validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtLTitle: {
                required: true,
                minlength: 2
            },
            ctl00$ContentPlaceHolder1$txtLAddress: {
                required: true,
                minlength: 2
            },
            ctl00$ContentPlaceHolder1$txtLDescription: {
                required: true,
                minlength: 10
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                required: true,
                customemail: true
            },
            ctl00$ContentPlaceHolder1$txtLMob: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 10
            },
            ctl00$ContentPlaceHolder1$lbPincodeList: {
                required: true
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtLTitle: {
                required: "This field is required",
                minlength: "Name must be 2 characters long"
            },
            ctl00$ContentPlaceHolder1$txtLAddress: {
                required: "This field is required",
                minlength: "Name must be 2 characters long"
            },
            ctl00$ContentPlaceHolder1$txtLDescription: {
                required: "This field is required",
                minlength: "Description must be 10 characters long"
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                required: "This field is required",
                customemail: "Not a valid Email"
            },
            ctl00$ContentPlaceHolder1$txtLMob: {
                required: "This field is required",
                number: "Not a valid Number",
                minlength: "Not a valid Number",
                maxlength: "Not a valid Number"
            },
            ctl00$ContentPlaceHolder1$lbPincodeList: {
                required: "This field is required"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtLTitle: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtLAddress: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtLDescription: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtEmail: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtLMob: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$lbPincodeList: {
                placement: 'top'
            }
        }
    });
    $('#logisticInfoForm #ContentPlaceHolder1_btnLogSubmit').click(function (e) {
        if (!$('#logisticInfoForm').valid()) {
            e.preventDefault();
        }
    });

    // User Regis Mob

    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0.');

    document.addEventListener("DOMContentLoaded", function (event) {
        $('#userRegisMob').validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtNumber: {
                    required: true,
                    number: true,
                    minlength: 10,
                    maxlength: 10,
                    regex: /^[^0]\d*$/
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtNumber: {
                    required: "This field is required",
                    number: "Not a valid Number",
                    minlength: "Not a valid Number",
                    maxlength: "Not a valid Number",
                }
            },
            tooltip_options: {
                ctl00$ContentPlaceHolder1$txtNumber: {
                    placement: 'top'
                }
            }
        });
        $('#userRegisMob #ContentPlaceHolder1_btnSubmit').click(function (e) {
            if (!$('#userRegisMob').valid()) {
                e.preventDefault();
            } else {

                $(this).val('Sending...').attr('class', 'btn btn-primary disabled');
            }
        });
    });


    // User Register
    //$('#userRegisMob #ContentPlaceHolder1_btnSubmit').click(function (e) {

    //});



})(jQuery);

function valiPhoneOtp(elm) {
    if ($(elm).val() === 'Verify OTP') {
        $.validator.addMethod('regex', function (value, element, param) {
            return this.optional(element) ||
                value.match(typeof param == 'string' ? new RegExp(param) : param);
        },
    'Must contain only digits');
        $('[name="ctl00$ContentPlaceHolder1$txtNumber"]').rules('add', {
            required: true,
            number: true,
            minlength: 4,
            maxlength: 4,
            regex: /\d*$/
        });
        if (!$('#userRegisMob').valid()) {
            return false;
        }
        else {
            $(elm).val('Verifying...').attr('class', 'btn btn-primary disabled');
        }
    }
}

function vali(elmnt) {
    $('#userRegisMob').validate().destroy();
    $.validator.addMethod('alpha', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must contain alphabets only');

    $.validator.addMethod('pincode', function (value) {
        if (stndis[value])
            return true;
        else
            false;
    }, "Enter Valid Pincode");
    $('#userRegisMob').validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtname: {
                required: true,
                minlength: 2,
                alpha: /^[a-zA-Z\s]+$/
            },
            ctl00$ContentPlaceHolder1$txtemail: {
                customemail: true
            },
            ctl00$ContentPlaceHolder1$txtpincode: {
                required: true,
                pincode: true
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                required: true,
                minlength: 3
            },
            ctl00$ContentPlaceHolder1$txtaddress: {
                required: true,
                minlength: 3
            },
            ctl00$ContentPlaceHolder1$txtcity: {
                required: true
            },
            ctl00$ContentPlaceHolder1$txtstate: {
                required: true
            },
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtname: {
                required: "This field is required",
                minlength: "Must contain 2 characters"
            },
            ctl00$ContentPlaceHolder1$txtemail: {
                customemail: "Enter Valid Email"
            },
            ctl00$ContentPlaceHolder1$txtpincode: {
                required: "This field is Required",
                pincode: "Please Enter Valid Pincode"
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                required: "This field is Required",
                minlength: "Must contain 3 characters"
            },
            ctl00$ContentPlaceHolder1$txtaddress: {
                required: "This field is Required",
                minlength: "Must contain 2 characters"
            },
            ctl00$ContentPlaceHolder1$txtcity: {
                required: "This field is Required"
            },
            ctl00$ContentPlaceHolder1$txtstate: {
                required: "This field is Required"
            },
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtname: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtemail: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtpincode: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtlandmark: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtaddress: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtcity: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtstate: {
                placement: 'top'
            },
        }
    });
    if (!$('#userRegisMob').valid()) {
        $('html, body').animate({ scrollTop: '200' }, 300);
        return false;
    }

    $(elmnt).val('Registering...').attr('class', 'btn btn-primary disabled');
}

function addpin() {
    if ($('#ContentPlaceHolder1_txtpincode').val().length === 6) {
        console.log($('#ContentPlaceHolder1_txtState').val())
        $('#ContentPlaceHolder1_txtstate').val(stndis[$('#ContentPlaceHolder1_txtpincode').val()].state);
        $('#ContentPlaceHolder1_txtcity').val(stndis[$('#ContentPlaceHolder1_txtpincode').val()].district);
    }
    else {
        $('#ContentPlaceHolder1_txtstate').val('');
        $('#ContentPlaceHolder1_txtcity').val('');
    }
}

function loginCred(elmnt) {
    $('#loginForm').validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtUName: {
                required: true,
                minlength: 8,
                maxlength: 20
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                required: true,
                minlength: 6,
                maxlength: 16
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtUName: {
                required: "This field is required",
                minlength: "Must contain 8 characters",
                maxlength: "Must be less than 21 characters"
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                required: "Password is Required",
                minlength: "Must contain 6 characters",
                maxlength: "Must be less than 17 characters"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtUName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtPwd: {
                placement: 'top'
            }
        }
    });
    if (!$('#loginForm').valid()) {
        return false;
    }

    $(elmnt).val('Logging In..').attr('class', 'btn btn-primary disabled');
}

$(document).ready(function () {
    $('input[type=number]').on('keydown', function (e) {
        if (!((e.keyCode > 95 && e.keyCode < 106)
          || (e.keyCode > 47 && e.keyCode < 58)
          || e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
            return false;
        }
    });
    $('[name="ctl00$ContentPlaceHolder1$txtAccNum"]').on('keydown', function (e) {
        if (!((e.keyCode > 95 && e.keyCode < 106)
          || (e.keyCode > 47 && e.keyCode < 58)
          || e.keyCode == 8)) {
            return false;
        }
    });
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
'Must not start with 0.');
    $('#userProf').validate({
        rules: {
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtOldPwd: {
                required: "This field is required",
                minlength: "Must contain 6 characters",
                maxlength: "Must not exceed from 16 characters"
            },
            ctl00$ContentPlaceHolder1$txtNewPwd: {
                required: "This field is required",
                minlength: "Must contain 6 characters",
                maxlength: "Must not exceed from 16 characters"
            },
            ctl00$ContentPlaceHolder1$txtNewMobile: {
                required: "This field is required",
                number: "Not a valid Number",
                minlength: "Not a valid Number",
                maxlength: "Not a valid Number",
                regex: "Must not start with 0"
            },
            ctl00$ContentPlaceHolder1$txtNewMail: {
                required: "This field is required"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtOldPwd: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtNewPwd: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtNewMobile: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtNewMail: {
                placement: 'top'
            }
        }
    });

    $('#userWallVal').validate({
        rules: {
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtUserId: {
                required: "This field is required",
                minlength: "Must contain 8 characters",
                maxlength: "Must not exceed from 20 characters"
            },
            ctl00$ContentPlaceHolder1$txtUsertransferAmt: {
                required: "This field is required",
                number: "Not a valid Amount",
                regex: "Must not start with 0",
                max: "Must be less than or equal to 25000"
            },
            ctl00$ContentPlaceHolder1$txtbankTransferAmt: {
                required: "This field is required",
                number: "Not a valid Amount",
                regex: "Must not start with 0",
                max: "Must be less than or equal to 25000"
            },
            ctl00$ContentPlaceHolder1$txtAccNum: {
                required: "This field is required",
                number: "Not a valid number",
                regexe: "Must contain only numbers",
                minlength: "Length must be 9 to 18 characters",
                maxlength: "Length must be 9 to 18 characters"
            },
            ctl00$ContentPlaceHolder1$txtAccHolderName: {
                required: "This field is required",
                minlength: "Length must be of atleast 3 characters",
                maxlength: "Length must be less than 150 characters",
            },
            ctl00$ContentPlaceHolder1$txtIFSCCode: {
                required: "Thie field is required",
                alphanum: "Not a valid IFSC"
            },
            ctl00$ContentPlaceHolder1$txtmob: {
                required: "This field is required",
                regex: "Not a valid Mobile no",
                minlength: "Not a valid Mobile no",
                maxlength: "Not a valid Mobile no"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtUserId: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtUsertransferAmt: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtbankTransferAmt: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtAccNum: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtAccHolderName: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtIFSCCode: {
                placement: 'top'
            },
            ctl00$ContentPlaceHolder1$txtmob: {
                placement: 'top'
            }
        }
    });

});
function updatePass(elm) {
    $('[name="ctl00$ContentPlaceHolder1$txtOldPwd"]').rules('add', {
        required: true,
        minlength: 6,
        maxlength: 16
    });
    $('[name="ctl00$ContentPlaceHolder1$txtNewPwd"]').rules('add', {
        required: true,
        minlength: 6,
        maxlength: 16
    });
    if ($('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]')[0]) {
        $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('remove');
    }
    if ($('[name="ctl00$ContentPlaceHolder1$txtNewMail"]')[0]) {
        $('[name="ctl00$ContentPlaceHolder1$txtNewMail"]').rules('remove');
    }
    if (!$('#userProf').valid()) {
        return false;
    }
    else {
        $(elm).text('Changing...').attr('class', 'btn btn-primary disabled');
    }
}

function sendOTP(elm) {
    if ($(elm).text() === 'Send OTP') {
        $.validator.addMethod('regex', function (value, element, param) {
            return this.optional(element) ||
                value.match(typeof param == 'string' ? new RegExp(param) : param);
        },
    'Must not start with 0.');
        $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('add', {
            required: true,
            number: true,
            minlength: 10,
            maxlength: 10,
            regex: /^[^0]\d*$/
        });
        if ($('[name="ctl00$ContentPlaceHolder1$txtNewMail"]')[0])
            $('[name="ctl00$ContentPlaceHolder1$txtNewMail"]').rules('remove');
        $('[name="ctl00$ContentPlaceHolder1$txtOldPwd"]').rules('remove');
        $('[name="ctl00$ContentPlaceHolder1$txtNewPwd"]').rules('remove');
        if (!$('#userProf').valid()) {
            return false;
        }
        else {
            $(elm).text('Sending...').attr('class', 'btn btn-primary disabled');
            $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('remove');
        }
    } else {
        $.validator.addMethod('regex', function (value, element, param) {
            return this.optional(element) ||
                value.match(typeof param == 'string' ? new RegExp(param) : param);
        },
    'Must contain only digits');
        $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('add', {
            required: true,
            number: true,
            minlength: 4,
            maxlength: 4,
            regex: /\d*$/
        });

        if ($('[name="ctl00$ContentPlaceHolder1$txtNewMail"]')[0])
            $('[name="ctl00$ContentPlaceHolder1$txtNewMail"]').rules('remove');
        $('[name="ctl00$ContentPlaceHolder1$txtOldPwd"]').rules('remove');
        $('[name="ctl00$ContentPlaceHolder1$txtNewPwd"]').rules('remove');
        if (!$('#userProf').valid()) {
            return false;
        }
        else {
            $(elm).text('Verifying...').attr('class', 'btn btn-primary disabled');
            $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('remove');
        }
    }
}

function updateEmail(elm) {
    $.validator.addMethod("customemail",
    function (value, element) {
        return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
    },
    "Please Enter Valid Email"
    );
    $('[name="ctl00$ContentPlaceHolder1$txtNewMail"]').rules('add', {
        required: true,
        customemail: true
    });
    if ($('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]')[0]) {
        $('[name="ctl00$ContentPlaceHolder1$txtNewMobile"]').rules('remove');
    }
    $('[name="ctl00$ContentPlaceHolder1$txtOldPwd"]').rules('remove');
    $('[name="ctl00$ContentPlaceHolder1$txtNewPwd"]').rules('remove');
    if (!$('#userProf').valid()) {
        return false;
    }
    else {
        $(elm).text('Updating...').attr('class', 'btn btn-primary disabled');
    }
}

function validUserTra(elm) {
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0');
    $('[name="ctl00$ContentPlaceHolder1$txtUserId"]').rules('add', {
        required: true,
        minlength: 8,
        maxlength: 20
    });
    $('[name="ctl00$ContentPlaceHolder1$txtUsertransferAmt"]').rules('add', {
        required: true,
        number: true,
        regex: /^[^0]\d*$/,
        max: 25000
    });
    if (!$('#userWallVal').valid()) {
        return false;
    }
    else {
        $(elm).val('Proccessing...').attr('class', 'btn btn-primary disabled');
    }
}

function validbankTra(elm) {


    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0');
    $.validator.addMethod('regexe', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must contains only number');
    $.validator.addMethod('alphanum', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Not a valid IFSC');
    $.validator.addMethod('alpha', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must contain alphabets only');
    $('[name="ctl00$ContentPlaceHolder1$txtbankTransferAmt"]').rules('add', {
        required: true,
        number: true,
        regex: /^[^0]\d*$/,
        max: 25000
    });

    $('[name="ctl00$ContentPlaceHolder1$txtAccNum"]').rules('add', {
        required: true,
        minlength: 9,
        maxlength: 18,
        number: true,
        regexe: /\d*$/,
    });

    $('[name="ctl00$ContentPlaceHolder1$txtAccHolderName"]').rules('add', {
        required: true,
        minlength: 3,
        maxlength: 150,
        alpha: /^[a-zA-Z\s]+$/
    });
    $('[name="ctl00$ContentPlaceHolder1$txtIFSCCode"]').rules('add', {
        required: true,
        alphanum: /^[A-Z]{4}0\d{6}$/
    });
    if (!$('#userWallVal').valid()) {
        return false;
    }
    else {
        $(elm).val('Proccessing...').attr('class', 'btn btn-primary disabled');
    }
}

function referVal(elm) {
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0');
    $('[name="ctl00$ContentPlaceHolder1$txtmob"]').rules('add', {
        required: true,
        minlength: 10,
        maxlength: 10,
        regex: /^[^0]\d*$/
    });
    if (!$('#userWallVal').valid()) {
        return false;
    }
    else {
        $(elm).val('Referring...').attr('class', 'btn btn-primary disabled');
    }
}

function ccc(e) {
    try {
        if (!((e.keyCode > 95 && e.keyCode < 106)
          || (e.keyCode > 47 && e.keyCode < 58)
          || e.keyCode == 8 || e.keyCode == 37 || e.keyCode == 39)) {
            return false;
        }
    } catch (err) { }
}

var count = 0;
function resend(elm) {
    $(elm).text('Sending...').attr('class', 'btn btn-primary disabled');;
    count++;
    if (count == 3) {
        count = 0;
        $(elm).remove();
        return false;
    }
    return true;
}

function validPhone(elm) {
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0');
    $('#form1').validate().destroy();
    if ($(elm).text() === 'Send OTP') {
        $('#form1').validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: true,
                    minlength: 10,
                    maxlength: 10,
                    regex: /^[^0]\d*$/,
                    number: true
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: "This Field is required",
                    minlength: "Not a valid Phone Number",
                    maxlength: "Not a valid Phone Number",
                    number: "Not a valid Phone number"
                }
            }
        });
        if (!$('#form1').valid()) {
            return false;
        }
        else {
            $(elm).text('Sending...').attr('class', 'btn btn-primary login-butt disabled');
        }
    } else if ($(elm).text() === 'Verify OTP') {
        $('#form1').validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: true,
                    minlength: 4,
                    maxlength: 4,
                    regex: /\d*$/,
                    number: true
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: "This Field is required",
                    minlength: "Not a valid OTP",
                    maxlength: "Not a valid OTP",
                    number: "Not a valid OTP"
                }
            }
        });
        if (!$('#form1').valid()) {
            return false;
        }
        else {
            $(elm).text('Verifying...').attr('class', 'btn btn-primary login-butt disabled');
        }
    } else {
        $("#form1").validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: true,
                    minlength: 8,
                    maxlength: 20
                },
                ctl00$ContentPlaceHolder1$txtPwd: {
                    required: true,
                    minlength: 6,
                    maxlength: 16
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    required: "This field is required",
                    minlength: "Must be 8 characters long",
                    maxlength: "Length must be less than or equal to 20"
                },
                ctl00$ContentPlaceHolder1$txtPwd: {
                    required: "This field is required",
                    minlength: "Password must be 6 characters long",
                    maxlength: "Length must be less than or equal to 16"
                }
            },
            tooltip_options: {
                ctl00$ContentPlaceHolder1$txtMob: {
                    placement: 'right'
                },
                ctl00$ContentPlaceHolder1$txtPwd: {
                    placement: 'right'
                }
            }
        });
        if (!$('#form1').valid()) {
            return false;
        }
        else {
            $(elm).text('Logging...').attr('class', 'btn btn-primary login-butt disabled');
        }
    }
}

function newAddress(elmnt) {
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
    'Must not start with 0');
    if ($('#ContentPlaceHolder1_rbtnAddress_1').attr('checked') == 'checked') {
        $.validator.addMethod('alpha', function (value, element, param) {
            return this.optional(element) ||
                value.match(typeof param == 'string' ? new RegExp(param) : param);
        },
    'Must contain alphabets only');

        $.validator.addMethod('pincode', function (value) {
            if (stndis[value])
                return true;
            else
                false;
        }, "Enter Valid Pincode");
        $('#newAddress').validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtName: {
                    required: true,
                    minlength: 2,
                    alpha: /^[a-zA-Z\s]+$/
                },
                ctl00$ContentPlaceHolder1$txtPincode: {
                    required: true,
                    pincode: true
                },
                ctl00$ContentPlaceHolder1$txtLandmark: {
                    required: true,
                    minlength: 3
                },
                ctl00$ContentPlaceHolder1$txtAddress: {
                    required: true,
                    minlength: 3
                },
                ctl00$ContentPlaceHolder1$txtCity: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtState: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtPhone: {
                    required: true,
                    minlength: 10,
                    maxlength: 10,
                    regex: /^[^0]\d*$/,
                    number: true
                }
            },
            messages: {
                ctl00$ContentPlaceHolder1$txtName: {
                    required: "This field is required",
                    minlength: "Must contain 2 characters"
                },
                ctl00$ContentPlaceHolder1$txtPincode: {
                    required: "This field is Required",
                    pincode: "Please Enter Valid Pincode"
                },
                ctl00$ContentPlaceHolder1$txtLandmark: {
                    required: "This field is Required",
                    minlength: "Must contain 3 characters"
                },
                ctl00$ContentPlaceHolder1$txtAddress: {
                    required: "This field is Required",
                    minlength: "Must contain 2 characters"
                },
                ctl00$ContentPlaceHolder1$txtCity: {
                    required: "This field is Required"
                },
                ctl00$ContentPlaceHolder1$txtState: {
                    required: "This field is Required"
                },
                ctl00$ContentPlaceHolder1$txtPhone: {
                    required: "This Field is required",
                    minlength: "Not a valid Number",
                    maxlength: "Not a valid Number",
                    number: "Not a valid Number"
                }
            },
            tooltip_options: {
                ctl00$ContentPlaceHolder1$txtName: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtPincode: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtLandmark: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtAddress: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtCity: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtState: {
                    placement: 'top'
                },
                ctl00$ContentPlaceHolder1$txtPhone: {
                    placement: 'top'
                }
            }
        });
        if (!$('#newAddress').valid()) {
            $('html, body').animate({ scrollTop: '200' }, 300);
            return false;
        }
        $(elmnt).text('Placing...').attr('class', 'btn btn-primary disabled');
    }
}

function validateProduct(elm) {
    $('#f1').validate().destroy();
    $.validator.addMethod('regex', function (value, element, param) {
        return this.optional(element) ||
            value.match(typeof param == 'string' ? new RegExp(param) : param);
    },
'Must not start with 0.');
    $('#f1').validate({
        rules: {
            ctl00$ContentPlaceHolder1$txtPSellingPrice: {
                required: true,
                
                number: true
            },
            ctl00$ContentPlaceHolder1$txtPCostPrice: {
                required: true,
                
                number: true
            },
            ctl00$ContentPlaceHolder1$txtPQuantity: {
                required: true,
                regex: /^[^0]\d*$/,
                number: true
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$txtPSellingPrice: {
                required: "This field is required",
                regex: "Not a valid amount",
                number: "Not a valid amount"
            },
            ctl00$ContentPlaceHolder1$txtPCostPrice: {
                required: "This field is required",
                regex: "Not a valid amount",
                number: "Not a valid amount"
            },
            ctl00$ContentPlaceHolder1$txtPQuantity: {
                required: "This field is required",
                regex: "Not a valid no",
                number: "Not a valid no"
            }
        },
        tooltip_options: {
            ctl00$ContentPlaceHolder1$txtPSellingPrice: {
                placement: "top"
            },
            ctl00$ContentPlaceHolder1$txtPCostPrice: {
                placement: "top"
            },
            ctl00$ContentPlaceHolder1$txtPQuantity: {
                placement: "top"
            }
        }
    });
    if (!$('#f1').valid()) {
        return false;
    }
    else {
        $('#ContentPlaceHolder1_btnProdSubmit').val('Adding...').attr('class', 'btn btn-primary disabled');
    }
}