{* Icon mapping for nav items *}
{foreach $navbar as $item}
    {* Skip Network Status *}
    {if $item->getName() == "Network Status"}{continue}{/if}
    {* Determine icon based on menu name *}
    {assign var="navIcon" value=""}
    {if $item->getName() == "Home"}{assign var="navIcon" value="fas fa-home"}
    {elseif $item->getName() == "Store"}{assign var="navIcon" value="fas fa-store"}
    {elseif $item->getName() == "Announcements"}{assign var="navIcon" value="fas fa-bullhorn"}
    {elseif $item->getName() == "Knowledgebase" || $item->getName() == "Knowledge Base"}{assign var="navIcon" value="fas fa-book"}
    {elseif $item->getName() == "Contact Us"}{assign var="navIcon" value="fas fa-envelope"}
    {elseif $item->getName() == "Affiliates"}{assign var="navIcon" value="fas fa-handshake"}
    {elseif $item->getName() == "Login"}{assign var="navIcon" value="fas fa-sign-in-alt"}
    {elseif $item->getName() == "Account"}{assign var="navIcon" value="fas fa-user-circle"}
    {elseif $item->getName() == "Register"}{assign var="navIcon" value=""}
    {elseif $item->getName() == "Downloads"}{assign var="navIcon" value="fas fa-download"}
    {elseif $item->getName() == "Support"}{assign var="navIcon" value="fas fa-life-ring"}
    {elseif $item->getName() == "Services"}{assign var="navIcon" value="fas fa-server"}
    {elseif $item->getName() == "Domains"}{assign var="navIcon" value="fas fa-globe"}
    {elseif $item->getName() == "Billing"}{assign var="navIcon" value="fas fa-file-invoice-dollar"}
    {/if}

    <li menuItemName="{$item->getName()}" class="d-block{if $item@first} no-collapse{/if}{if $item->hasChildren()} dropdown no-collapse{/if}{if $item->getClass()} {$item->getClass()}{/if}{if $item->getName() == 'Register'} nav-register{/if}" id="{$item->getId()}">
        <a class="{if $item->getName() == 'Register'}btn btn-register{elseif $item->hasChildren()}dropdown-toggle{/if}" {if $item->hasChildren()}data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"{else}href="{$item->getUri()}"{/if}{if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if}>
            {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;
            {elseif $navIcon}<i class="{$navIcon}"></i>&nbsp;{/if}
            {$item->getLabel()}
            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
        </a>
        {if $item->hasChildren()}
            <ul class="dropdown-menu{if isset($rightDrop) && $rightDrop} dropdown-menu-right{/if}">
            {foreach $item->getChildren() as $childItem}
                {* Skip Network Status in dropdowns *}
                {if $childItem->getName() == "Network Status"}{continue}{/if}
                {if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
                    <div class="dropdown-divider"></div>
                {else}
                    {* Icon mapping for dropdown children *}
                    {assign var="childIcon" value=""}
                    {if $childItem->getName() == "Services" || $childItem->getName() == "My Services"}{assign var="childIcon" value="fas fa-server"}
                    {elseif $childItem->getName() == "Domains" || $childItem->getName() == "My Domains"}{assign var="childIcon" value="fas fa-globe"}
                    {elseif $childItem->getName() == "Billing" || $childItem->getName() == "My Invoices"}{assign var="childIcon" value="fas fa-file-invoice-dollar"}
                    {elseif $childItem->getName() == "Invoices"}{assign var="childIcon" value="fas fa-file-invoice"}
                    {elseif $childItem->getName() == "Tickets" || $childItem->getName() == "Support Tickets"}{assign var="childIcon" value="fas fa-ticket-alt"}
                    {elseif $childItem->getName() == "Open Ticket"}{assign var="childIcon" value="fas fa-plus-circle"}
                    {elseif $childItem->getName() == "Announcements"}{assign var="childIcon" value="fas fa-bullhorn"}
                    {elseif $childItem->getName() == "Knowledgebase" || $childItem->getName() == "Knowledge Base"}{assign var="childIcon" value="fas fa-book"}
                    {elseif $childItem->getName() == "Downloads"}{assign var="childIcon" value="fas fa-download"}
                    {elseif $childItem->getName() == "Affiliates"}{assign var="childIcon" value="fas fa-handshake"}
                    {elseif $childItem->getName() == "Emails"}{assign var="childIcon" value="fas fa-envelope-open-text"}
                    {elseif $childItem->getName() == "Add Funds"}{assign var="childIcon" value="fas fa-wallet"}
                    {elseif $childItem->getName() == "Quotes"}{assign var="childIcon" value="fas fa-quote-right"}
                    {elseif $childItem->getName() == "Contacts"}{assign var="childIcon" value="fas fa-address-book"}
                    {elseif $childItem->getName() == "Security Settings"}{assign var="childIcon" value="fas fa-shield-alt"}
                    {elseif $childItem->getName() == "Email History"}{assign var="childIcon" value="fas fa-history"}
                    {elseif $childItem->getName() == "Account Details" || $childItem->getName() == "My Details" || $childItem->getName() == "Update Details"}{assign var="childIcon" value="fas fa-user-edit"}
                    {elseif $childItem->getName() == "Change Password"}{assign var="childIcon" value="fas fa-key"}
                    {elseif $childItem->getName() == "Payment Methods"}{assign var="childIcon" value="fas fa-credit-card"}
                    {elseif $childItem->getName() == "Profile"}{assign var="childIcon" value="fas fa-user"}
                    {elseif $childItem->getName() == "User Management"}{assign var="childIcon" value="fas fa-users-cog"}
                    {elseif $childItem->getName() == "Logout"}{assign var="childIcon" value="fas fa-sign-out-alt"}
                    {elseif $childItem->getName() == "Register"}{assign var="childIcon" value="fas fa-user-plus"}
                    {elseif $childItem->getName() == "Login"}{assign var="childIcon" value="fas fa-sign-in-alt"}
                    {elseif $childItem->getName() == "Contact Us"}{assign var="childIcon" value="fas fa-envelope"}
                    {elseif $childItem->getName() == "Home"}{assign var="childIcon" value="fas fa-home"}
                    {elseif $childItem->getName() == "Store" || $childItem->getName() == "Order New Services"}{assign var="childIcon" value="fas fa-shopping-cart"}
                    {elseif $childItem->getName() == "Manage SSL"}{assign var="childIcon" value="fas fa-lock"}
                    {/if}
                    <li menuItemName="{$childItem->getName()}" class="dropdown-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                        <a href="{$childItem->getUri()}" class="dropdown-item px-2 py-0"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} fa-fw"></i>&nbsp;
                            {elseif $childIcon}<i class="{$childIcon} fa-fw"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                            {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                        </a>
                    </li>
                {/if}
            {/foreach}
            </ul>
        {/if}
    </li>
{/foreach}
{if !isset($rightDrop) || !$rightDrop}
    <li class="d-none dropdown collapsable-dropdown">
        <a class="dropdown-toggle" href="#" id="navbarDropdownMenu" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            {lang key='more'}
        </a>
        <ul class="collapsable-dropdown-menu dropdown-menu" aria-labelledby="navbarDropdownMenu">
        </ul>
    </li>
{/if}
