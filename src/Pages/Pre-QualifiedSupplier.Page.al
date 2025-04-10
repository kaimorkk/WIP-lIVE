Page 52193908 "Pre-Qualified Supplier"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Prequalified Suppliers1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(VendorNo;"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(VendorType;"Vendor Type")
                {
                    ApplicationArea = Basic;
                }
                field(Selected;Selected)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(PhysicalAddress;"Physical Address")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress;"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(Email;"E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo;"Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field(MobileNo;"Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field(ContactPerson;"Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field(KBABankCode;"KBA Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankaccountNo;"Bank account No")
                {
                    ApplicationArea = Basic;
                }
                field(KBABranchCode;"KBA Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field(PreQualified;"Pre Qualified")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyPINNo;"Company PIN No")
                {
                    ApplicationArea = Basic;
                }
                field(Blacklisted;Blacklisted)
                {
                    ApplicationArea = Basic;
                }
                field(DefaultPaymentMode;"Default Payment Mode")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumOrderAmount;"Minimum Order Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumOrderQuantity;"Maximum Order Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(MinimumOrderQuantity;"Minimum Order Quantity")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumOrderAmount;"Maximum Order Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Supplier)
            {
                Caption = 'Supplier';
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';

                    trigger OnAction()
                    begin
                            CreateVend(Rec);
                    end;
                }
            }
        }
    }

    var
        Prequalified: Record "Prequalified Suppliers1";
}

