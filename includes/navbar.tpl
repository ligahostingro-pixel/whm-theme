{* Icon mapping for nav items *}
{foreach $navbar as $item}
    {* Determine icon based on menu name *}
    {assign var="navIcon" value=""}
    {if $item->getName() == "Home"}{assign var="navIcon" value="fas fa-home"}
    {elseif $item->getName() == "Store"}{assign var="navIcon" value="fas fa-store"}
    {elseif $item->getName() == "Announcements"}{assign var="navIcon" value="fas fa-bullhorn"}
    {elseif $item->getName() == "Knowledgebase" || $item->getName() == "Knowledge Base"}{assign var="navIcon" value="fas fa-book"}
    {elseif $item->getName() == "Network Status"}{assign var="navIcon" value="fas fa-signal"}
    {elseif $item->getName() == "Contact Us"}{assign var="navIcon" value="fas fa-envelope"}
    {elseif $item->getName() == "Affiliates"}{assign var="navIcon" value="fas fa-handshake"}
    {elseif $item->getName() == "Login"}{assign var="navIcon" value="fas fa-globe"}
    {elseif $item->getName() == "Register"}{assign var="navIcon" value=""}
    {elseif $item->getName() == "Account"}{assign var="navIcon" value=""}
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
                {if $childItem->getClass() && in_array($childItem->getClass(), ['dropdown-divider', 'nav-divider'])}
                    <div class="dropdown-divider"></div>
                {else}
                    <li menuItemName="{$childItem->getName()}" class="dropdown-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                        <a href="{$childItem->getUri()}" class="dropdown-item px-2 py-0"{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
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
