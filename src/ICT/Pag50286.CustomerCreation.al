page 50286 "Customer Creation"
{
    APIGroup = 'CustomerManagement';
    APIPublisher = 'GreenComEnterpriseSolutionsLimited';
    APIVersion = 'v1.0';
    Caption = 'customerCreation';
    DelayedInsert = true;
    EntityName = 'createCustomer';
    EntitySetName = 'entitySetName';
    PageType = API;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(name; Rec.Name)
                {
                    Caption = 'Name';
                }
                field(address; Rec.Address)
                {
                    Caption = 'Address';
                }
                field(city; Rec.City)
                {
                    Caption = 'City';
                }
                // field(agentCode; Rec."Agent Code")
                // {
                //     Caption = 'Agent Code';
                // }
                field(dateOfBirth; Rec."Date of Birth")
                {
                    Caption = 'Date of Birth';
                }
                // field(disabled; Rec.Disabled)
                // {
                //     Caption = 'Disabled';
                // }
                field(eMail; Rec."E-Mail")
                {
                    Caption = 'Email';
                }
                // field(idNo; Rec."ID. No.")
                // {
                //     Caption = 'ID. No.';
                // }
            }
        }
    }
}
