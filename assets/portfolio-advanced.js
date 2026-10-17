(()=>{
  const toggle=document.querySelector('.menu-toggle');
  const menu=document.querySelector('#menu-principal');
  const back=document.querySelector('.back-to-top');
  const contact=document.querySelector('.contact-menu');
  if(!toggle||!menu)return;
  const closeMenu=()=>{menu.classList.remove('open');toggle.setAttribute('aria-expanded','false');toggle.setAttribute('aria-label','Abrir menu')};
  toggle.addEventListener('click',()=>{const open=menu.classList.toggle('open');toggle.setAttribute('aria-expanded',String(open));toggle.setAttribute('aria-label',open?'Fechar menu':'Abrir menu')});
  menu.querySelectorAll('a').forEach(link=>link.addEventListener('click',()=>{closeMenu();if(contact)contact.open=false}));
  document.addEventListener('click',event=>{if(contact&&contact.open&&!contact.contains(event.target))contact.open=false});
  document.addEventListener('keydown',event=>{if(event.key!=='Escape')return;if(contact&&contact.open){contact.open=false;contact.querySelector('summary')?.focus();return}if(menu.classList.contains('open')){closeMenu();toggle.focus()}});
  const sectionLinks=[...menu.querySelectorAll('a[href^="#"]')];
  const sections=sectionLinks.map(link=>document.querySelector(link.getAttribute('href'))).filter(Boolean);
  if('IntersectionObserver' in window){const observer=new IntersectionObserver(entries=>entries.forEach(entry=>{if(entry.isIntersecting)sectionLinks.forEach(link=>link.classList.toggle('active',link.getAttribute('href')==='#'+entry.target.id))}),{rootMargin:'-30% 0px -60%',threshold:0});sections.forEach(section=>observer.observe(section))}
  if(back){addEventListener('scroll',()=>back.classList.toggle('visible',scrollY>700),{passive:true});back.addEventListener('click',()=>scrollTo({top:0,behavior:'smooth'}))}
})();